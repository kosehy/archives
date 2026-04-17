# Dropping Cloudflare for bunny.net

Source: https://jola.dev/posts/dropping-cloudflare
Shared link: https://share.google/VubPnD8TxS5KxJLss
Archived: 2026-04-10
Language: English
Type: Preserved original article

TL;DR my motivation and experience for moving my blog from Cloudflare to bunny.net

I’ve been a long time Cloudflare user. They offer a solid service that is free for the vast majority of their users, that’s very generous. Their infrastructure is massive and their feature set is undeniably incredible.

One of my biggest concerns though is around how easily I could become heavily dependent on this one single company that then can decide to cut me off and disable all of my websites, for any arbitrary reason. It’s a single point of failure for the internet. Every Cloudflare outage ends up in the news. And I can’t help but feel that the idea of centralizing the internet into a single US corporation feels off. Not to mention the various scandals that have surrounded them. So I was open to alternatives.

## Bunny.net

[Bunny.net](https://bunny.net?ref=f0l8865b7g) (affiliate link because why not, raw link [here](https://bunny.net)) is a Slovenian (EU) company that is building up a lot of momentum. Their CDN-related services rival Cloudflare already, and although their PoP network is smaller than Cloudflare’s, they score highly on performance and speed across the globe. It’s a genuinely competitive alternative to Cloudflare.

It has the additional benefit of being a European company, and I like the idea of growing and supporting the European tech scene.

## What I was moving away from

I’ve been using various different services, but focusing on this blog, the first thing was Cloudflare as the registrar for the domain name. I did some research on alternative registrars, but I just didn’t find any good European options. The closest I found was INWX, but their lack of free WHOIS Privacy made them a non-option. I ended up with Porkbun. They run on Cloudflare infrastructure, but they have better support. So the remaining thing Cloudflare was doing for me was the “Orange Cloud”: automatic caching, origin hiding, and optional protection features.

So that’s what we’re moving over! I’m gonna walk you through how to set up the bunny.net CDN for your website, with some sensible defaults.

## Step by step

Setting up your bunny.net account is quick and you get $20 worth of free credits to play around with, those are valid for 14 days. You don’t need to give them a credit card up front to try things out, but if you do, you get another $30 worth of credits. You do need to confirm your email though before you can start setting things up. Once you’re out of the trial, you pay per use, which for most cases is cents a month. However, note that bunny.net require a minimum payment of $1 per month.

I guess a cheap price to pay to stop being the product and start becoming the customer.

### Creating your pull zone

The pull zone is the main mechanism for enabling the CDN for your website. You’ll find them under CDN in the left navigation bar. Here’s how to set one up:

- Fill in the pull zone name. Just make it something meaningful to you, for example the website name.
- For origin type, select Origin URL.
- Fill in your Origin URL. This would be the address for directly accessing your server. In my case, it’s the public IP of my server.
- If you’re running multiple apps on your server, for example using Dokploy, coolify, or self-hosted PaaSs like that, you’ll want to pass the Host header as well. Here you put in the domain of your app. In my case, that’s jola.dev.
- For tier, select Standard.
- Finally you can select your pricing zones. Note that some zones are more expensive, so you can choose to disable them. This just means that people in those areas will get redirected to the closest zone you do have enabled.

And you’re done with the first part!

### Configuring your pull zone

Now that you’ve set up the pull zone, it’s time to hook it up to your website and domain. Go to the pull zone you created. You’ll see a “hostnames” screen. Time to connect things.

- Under “Add a custom hostname” fill in your website domain name.
- You’ll get a modal with some instructions. You need to follow them to set up the DNS name to point your website to go through the CDN.
- Go to where you manage domain name and add a CNAME record to point your domain to the given CNAME value in the modal, something like website.b-cdn.net.
- Once you’ve done that, wait a few minutes to let it propagate, and then click “Verify & Activate SSL”.
- If it says success, you’re done. Your website is now running through the bunny.net CDN, similar to the Cloudflare orange cloud.

### Configuring caching

This is the part where bunny.net will really shine through.

If your website is set up to return the appropriate cache headers for each resource, things will just work. Bunny defaults to respecting the cache control headers when pointing a pull zone at an origin site. To verify, go to Caching → General and check that “Respect origin Cache-Control” is set under “Cache expiration time”. Note that if you set no-cache, bunny will use that and will not cache at the edge.

Alternatively, if you don’t have cache headers set up, and you don’t want to control that yourself, you can instead enable Smart Cache. This will default to caching typically cached resources like images, CSS, JS files etc, while avoiding caching things like HTML pages. This will work for most cases.

But I wanted to go faster. The author describes a Phoenix router pipeline that adds a `cache-control` header of `public, s-maxage=86400, max-age=0`, allowing HTML pages to be cached at the CDN while staying immediately stale for browsers.

This setup means the site even caches HTML pages, making it extremely fast, but it also means the pull zone must be purged when a new post is published.

### Setting some sensible defaults

- Turn on Force SSL for the hostname.
- Enable Origin Shield and choose the location nearest the origin.
- Consider enabling stale cache while origin is offline and while updating.
- Add an edge rule that redirects the default `*.b-cdn.net` hostname to the real domain.

## Conclusion

The author presents bunny.net as a practical and lower-dependency alternative to Cloudflare for personal sites. The appeal is not just performance and cost, but also governance, geography, and the desire to avoid excessive reliance on a single dominant infrastructure company.
