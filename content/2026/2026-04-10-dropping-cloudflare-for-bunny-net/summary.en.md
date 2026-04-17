# Summary — Dropping Cloudflare for bunny.net

## Core idea

This post explains why the author moved a personal site from Cloudflare-backed delivery toward bunny.net, emphasizing dependency risk and infrastructure centralization as much as performance or cost.

## Key points

- The author is uneasy with relying too heavily on a single dominant infrastructure provider.
- bunny.net is presented as a credible European alternative with competitive CDN performance.
- The domain registrar was moved to Porkbun, while the CDN/proxy layer was moved to bunny.net.
- The article walks through creating a pull zone, connecting a custom hostname, enabling SSL, and configuring caching.
- The author caches even HTML pages by setting explicit cache headers from Phoenix.
- Extra recommendations include Force SSL, Origin Shield, stale-cache options, and a default-domain redirect rule.

## One-line takeaway

The post argues that moving away from Cloudflare can be motivated not only by features or price, but by a desire to reduce infrastructure concentration risk.
