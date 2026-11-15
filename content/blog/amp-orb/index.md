+++
title = "AmpCode - it's orbin' time"
date = 2026-11-15
description = "Four years ago I spent a whole weekend getting code-server running so I could code on my iPad. Now it's a two minute app install and the machine lives in the cloud. It's orbin' time."

[extra]
footnote_backlinks = true
quick_navigation_buttons = true
+++

### "The good old days"

Four years ago I wrote about getting [code-server](../codeserver/) running so I could code from my iPad: code-server on Arch, Caddy compiled from source because I wanted a wildcard cert for my Route 53 domain, a couple of systemd services, port 443 on the router and DynDNS on top, because my ISP doesn't hand out static IPs.

### Fast forward to today

These days most of my side project hacking happens with [Amp](https://ampcode.com) and more specifically the orbs: every thread gets its own sandbox in the cloud with the repository and tools already set up. The agent installs what it needs, runs the project, opens a browser (if necessary), takes screenshots and checks its own work before I ever see a diff. When it's done, the orb goes to sleep and costs nothing, and wakes up on demand with the conversation, files and services all still in place.

No Caddy, no systemd, no open ports, no DynDNS. I guess SaaS is dead, unless it "slays".

### Choose your client

For example on the iPad: install the Amp app via [TestFlight](https://ampcode.com/app), or simply stick to the web browser. But access is just the same from any device, whether I'm at my desk using the same old desktop, on the couch with the iPad or in the bathroom on the phone.

For perspective: in 2021 it took me an entire weekend to get my previous setup working and it wasn't even half as convenient. Now I get isolated machines and a mighty coding agent right with it.

### Et Voilà

What used to be a weekend infrastructure project is now a two-minute app install. And yes, I drafted this post on the very same iPad, again. Some things don't change ;)

{{< dimmable_image src="blog/amp-orb/img/ipad.jpg" alt="This blog post being written in Amp on an iPad with a Magic Keyboard" />}}
