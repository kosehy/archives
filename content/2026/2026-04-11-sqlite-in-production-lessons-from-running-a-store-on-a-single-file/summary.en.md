# SQLite in Production: Lessons from Running a Store on a Single File — Summary

Source: https://ultrathink.art/blog/sqlite-in-production-lessons
Based on: `archive/2026/2026-04-11-sqlite-in-production-lessons-from-running-a-store-on-a-single-file/original.en.md`
Saved: 2026-04-11

## One-paragraph summary
This article argues that SQLite can work surprisingly well for a real production e-commerce system when traffic is moderate and deployment is constrained to a single server, especially with Rails 8 and WAL mode. The author explains the operational benefits of simpler infrastructure, then focuses on the real failure mode they hit: overlapping blue-green deploys on shared Docker volumes caused write contention and two successful Stripe payments to disappear from the orders table. The piece frames this not as a blanket indictment of SQLite, but as a warning that filesystem-level concurrency, deployment cadence, and operational discipline matter far more than many teams assume.

## Key points
- SQLite handled normal production traffic well because the workload was mostly read-heavy and WAL mode reduced read/write blocking.
- The serious failure came from overlapping container deploys sharing the same SQLite volume, not from ordinary request traffic.
- `sqlite_sequence` was useful as a forensic tool because it preserved evidence that IDs had been assigned even though rows were missing.
- SQLite remains attractive for single-server deployments, but teams must respect limits around multi-writer concurrency and deploy behavior.

## Memorable takeaway
SQLite can be good enough for production, but only if the surrounding operational model is designed to respect its constraints.
