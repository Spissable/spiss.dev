+++
title = "Code-Server - taking the home office to the outside"
date = 2021-08-20
updated = 2023-11-18
description = "While working from home is nice and all, I wanted to level up my home office experience to allow me to work from basically anywhere, without having too many compromises. And because using my Dell XPS 13 would have been too easy of a choice, I challenged myself to use an iPad instead."

[extra]
footnote_backlinks = true
quick_navigation_buttons = true
+++

### The Challenge
While iPads got the shiny new M1 processor and therefore loads of processing power, the coding experience is still pretty much nonexistent, due to the software limitations of iPadOS.
And that's where [code-server](https://github.com/cdr/code-server) comes into play:

> Run VS Code on any machine anywhere and access it in the browser.

Sounds perfect for my use case! 

Below are some of the key steps I had to take to make it all work. However, this is not a detailed step-by-step guide.

### Setting up Code-Server
The code-server is available via the AUR for Arch Linux users at [AUR link](https://aur.archlinux.org/packages/code-server/).

Once installed, the actual setup is pretty easy.
```
$ cat ~/.config/code-server/config.yaml

bind-addr: 0.0.0.0:1897
auth: password
password: XXXXXXXXXX
cert: false
```

```
$ sudo systemctl edit --full code-server@USER

...
ExecStart=/usr/bin/code-server --proxy-domain *.XXXXXXXXXX.spiss.dev
...
```


### Setting up Caddy
As the code-server docs suggest, I decided to go for Caddy as my reverse proxy. This made the next part of the set-up pretty easy as well.
The only sort of annoying part was that I couldn't use the caddy package from the Arch repo, but I had to compile it from source together with the Route 53 plugin, which I use to manage my domain. See the GitHub Repo for more details: [GitHub link](https://github.com/caddy-dns/route53)

Once installed, I added this config file:

```
$ cat /etc/caddy/Caddyfile

XXXXXXXXXX.spiss.dev *.XXXXXXXXXX.spiss.dev {
  tls {
    dns route53 {
      max_retries 10
    }
  }

  reverse_proxy 127.0.0.1:1897
}
```

In order for Caddy to obtain a **wildcard** SSL certificate, I had to add a user who is allowed to manage my Route 53. See the GitHub repo for more details: [GitHub link](https://github.com/libdns/route53)

```
$ sudo systemctl edit --full caddy.service

...
[Service]
Environment=AWS_ACCESS_KEY_ID=XXXXXXXXXX
Environment=AWS_SECRET_ACCESS_KEY=XXXXXXXXXX
...
```

### Setting up the Router
Almost done, phew. After starting all the necessary systemd services, this should be the first time a beautiful VS Code window is accessible on the iPad, but only on the same network.
Because I wanted to go outside my WI-FI range, I still had to open the 443 port on my router. Kinda scary, but code-server got us covered by blocking too many wrong password attempts. Since this is very router-dependent, I'll let you figure that one out. It's probably a good time to configure a firewall on your PC as well.

### DynDNS
Everything is working now, and if you have a static IP, you're done. Since my ISP doesn't give me one, I still had to configure some kind of DynDNS service to keep my IP address up-to-date in Route 53.
To achieve this, I configured yet another systemd service: [GitHub link](https://github.com/famzah/aws-dyndns)


### Et Voilà
Using the power of my desktop PC right from the browser, including forwarding of locally hosted web services. In fact, I wrote this whole blog post on my iPad via code-server on my PC. The locally running `0.0.0.0:1111` Zola site was automatically served via `1111.XXXXXXXXXX.spiss.dev` behind the same password protection.
And nowadays, I even find myself connecting to the code-server from my Dell XPS 13, as the Desktop PC is just way more powerful, especially when compiling large Rust projects ;)

{{ full_width_image(src="blog/codeserver/img/codeserver.png", alt="VS Code on iPad") }}

