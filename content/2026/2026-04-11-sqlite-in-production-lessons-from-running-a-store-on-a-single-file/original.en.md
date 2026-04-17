# SQLite in Production: Lessons from Running a Store on a Single File

Source: https://ultrathink.art/blog/sqlite-in-production-lessons
Saved: 2026-04-11

We run a production e-commerce store on SQLite. Not as a proof of concept. Not for a side project with three users. A real store, processing real Stripe payments, serving real customers.

Rails 8 made this a first-class choice. And for most of our operation, it's been excellent, simpler deploys, zero connection pooling headaches, no database server to manage. But "most of our operation" isn't all of it. Here's the part nobody warns you about.

## The Setup: Four Databases, One Volume

Our database.yml defines four SQLite databases in production:

```yaml
production:
  primary:
    database: storage/production.sqlite3
  cache:
    database: storage/production_cache.sqlite3
  queue:
    database: storage/production_queue.sqlite3
  cable:
    database: storage/production_cable.sqlite3
```

Primary handles orders, products, users. Cache is the Rails cache store. Queue runs Solid Queue (background jobs). Cable handles Action Cable connections. All four live in a storage/ directory that maps to a named Docker volume:

```yaml
# config/deploy.yml
volumes:
  - "ultrathink_storage:/rails/storage"
```

One Docker volume. Four database files. Every container that mounts this volume shares the same data. This is both the feature and the footgun.

## WAL Mode: Why It Works at All

SQLite's default journal mode locks the entire database on writes. One writer blocks all readers. For a web app handling concurrent requests, that's a non-starter.

WAL (Write-Ahead Logging) changes the model. Writers append to a separate `-wal` file instead of modifying the database directly. Readers continue reading from the main file. Multiple readers and a single writer can operate concurrently. Rails 8 enables WAL by default for SQLite databases.

For a store with our traffic levels, WAL mode handles everything comfortably. Product page views, cart operations, checkout flows, concurrent reads never block, and write contention is minimal because most requests are reads.

The `timeout: 5000` in our database config gives writers up to 5 seconds to acquire a lock before raising `SQLITE_BUSY`. We've never hit it during normal operation. SQLite's throughput ceiling is higher than most people assume, especially for read-heavy workloads.

## The Day We Lost Two Orders

February 4th. We pushed 11 commits to main in two hours. Each push triggers a deploy via GitHub Actions. Kamal runs blue-green deploys, it starts a new container, health-checks it, then stops the old one. During the switchover, both containers are running. Both mount `ultrathink_storage`. Both have the SQLite files open.

One deploy at a time? Fine. The overlap window is brief. WAL handles the concurrent access. The old container drains requests while the new one takes over.

Eleven deploys in two hours? The overlap windows started overlapping. Container A is still draining while container B starts up, and then container C's deploy begins before B is fully healthy. Three processes with the same WAL file open, all trying to write.

Orders 16 and 17 completed successfully in Stripe. Customers were charged. Payment intents show succeeded. But the order records never made it to the database. Somewhere in the WAL file contention, the writes were lost.

We diagnosed it through `sqlite_sequence`:

```sql
SELECT * FROM sqlite_sequence WHERE name='orders';
-- seq: 17

SELECT MAX(id) FROM orders;
-- 15
```

The auto-increment counter said 17 IDs had been assigned. Only 15 rows existed. Two orders, created and then gone. Stripe had the money. Our database didn't have the records.

## The Fix: Stop Deploying So Fast

The fix was procedural, not technical: stop pushing to main every ten minutes.

We added a rule, batch related changes, avoid rapid-fire pushes. It's in our `CLAUDE.md` (the governance file that all our AI agents follow):

> Avoid rapid-fire pushes to main, 11 pushes in 2h caused overlapping Kamal deploys with concurrent SQLite access. Orders 16/17 were lost despite successful Stripe charges.

This isn't a SQLite problem. It's a deployment pipeline problem that SQLite makes visible. Postgres with blue-green deploys handles this fine because connections go through a TCP socket, the new container connects to the same Postgres server, and the database engine manages write ordering. SQLite's write ordering depends on filesystem-level locking on a shared Docker volume, and that breaks down when containers overlap.

## sqlite_sequence: Your Forensic Tool

The `sqlite_sequence` table is the most underappreciated debugging tool in SQLite. It tracks the highest auto-increment value ever assigned for each table, even if that row was subsequently lost.

We use it to count historical work queue tasks. Our agents complete and purge thousands of tasks, but `sqlite_sequence` remembers:

```ruby
def count_historical_tasks
  result = ActiveRecord::Base.connection.execute(
    "SELECT seq FROM sqlite_sequence WHERE name='work_queue_tasks'"
  )
  result.first&.fetch("seq", 0) || 0
end
```

`WorkQueueTask.count` returns around 300 (current rows). The sequence shows 3,700+ (every task ever created). If those numbers diverge unexpectedly, something deleted rows it shouldn't have.

## The Gotchas Nobody Mentions

No `ILIKE`. PostgreSQL developers reach for `WHERE name ILIKE '%term%'` instinctively. SQLite throws a syntax error. Use `WHERE LOWER(name) LIKE '%term%'` instead.

`json_extract` returns native types. `json_extract(data, '$.id')` returns an integer if the value was stored as a number. Comparing it to a string silently fails. Always `CAST(json_extract(...) AS TEXT)` when you need string comparison.

Each `kamal app exec` spawns a new container. On our `t3.small` (2GB RAM), the web container uses around 780MB. Spawning an exec container for a quick database query adds another 500MB. Two concurrent exec calls during a deploy? That's 2.5GB on a 2GB machine. OOM killer takes the web process down.

`ActiveRecord timeout: 5000` is your safety net, not your solution. If you're hitting `SQLITE_BUSY` regularly, you have a concurrency problem that configuration can't fix. Reduce writer contention at the application level.

## Would We Choose SQLite Again?

Yes. For a single-server deployment with moderate write volume, SQLite eliminates an entire category of infrastructure complexity. No connection pool tuning. No database server upgrades. No replication lag. Backups are `sqlite3 production.sqlite3 '.backup backup.sqlite3'`, the `sqlite3 .backup` API handles WAL mode and concurrent writes safely, unlike a raw `cp` which can grab a half-written file. (Updated after HN feedback, `sqlite3 .backup` is the safe way.)

The constraint is real: one server, and careful deploy pacing. The day we need horizontal scaling or true multi-writer concurrency, we'll migrate to Postgres. Rails makes that switch straightforward, change the adapter, run the migrations, update the queries that use SQLite-specific syntax.

Until then, a single file handles everything. You just have to respect what it is.

Next time: Building an MCP Server So You Can Shop From Claude, how we packaged our store's API into a Model Context Protocol server and published it to npm.
