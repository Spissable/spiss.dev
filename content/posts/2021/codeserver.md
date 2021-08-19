+++
title = "Code-Server - Taking the home office to the outside"
date = 2021-08-19
+++

While working from home is nice and all, I wanted to make the most out of my new home (Portugal) and have a decent setup to work from outside in the sunshine. And because using my work laptop would have been too easy, I challenged myself to use an iPad for it.

<!-- more -->

### The Challenge
While iPads got the shiny new M1 processor and therefore loads of processing power, the coding experience is still pretty much non-existant, due to the software limitations of iPadOS.
That's when I found out about [code-server](https://github.com/cdr/code-server):

> Run VS Code on any machine anywhere and access it in the browser.

Sounds perfect for my use case! 

Below are some of the key steps I had to do to make it all work. The more detailed explanations are linked at every step.

### Setting up Code-Server
Code-server is available via the AUR for Arch Linux users at [AUR link](https://aur.archlinux.org/packages/code-server/).

Once installed, the actual set-up is just as easy.
```
$ cat ~/.config/code-server/config.yaml

bind-addr: 0.0.0.0:1897
auth: password
password: XXXXXXXXXX
cert: false
```

```
$ sudo systemctl edit --full code-server@$USE

...
ExecStart=/usr/bin/code-server --proxy-domain *.XXXXXXXXXX.spiss.dev
...
```


### Setting up Caddy
As the code-server docs suggest it, I decided to go for Caddy as my reverse proxy. This made the next part of the set-up pretty easy as well.
The only sort of annoying part was that I couldn't use the caddy package from the Arch repo, but I had to compile it from source together with the Route 53 plugin, which I use to manage my domain. See the Github Repo for more details: [Github link](https://github.com/caddy-dns/route53)

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

In order for Caddy to obtain a **wildcard** SSL certifcate, I had to add a user which is allowed to manage my Route 53. See the Github repo for more details: [Github link](https://github.com/libdns/route53)

```
$ sudo systemctl edit --full caddy.service

...
[Service]
Environment=AWS_ACCESS_KEY_ID=XXXXXXXXXX
Environment=AWS_SECRET_ACCESS_KEY=XXXXXXXXXX
...
```

### Setting up the Router
Almost done, phew. After starting all the necessary systemd services, this should be the first time a beautiful VSCode window should be accessible on the iPad, but only on the same network.
Because I actually want to go outside my wifi range, I still had to open the 443 port on my router. Kinda scary, but code-server got us covered by blocking too many wrong password attempts. Since this is very router dependent, I'll let you figure that one out. It's probably also a good time to configure a firewall on your PC etc.

### DynDNS
Everything is working by now and if you're one of those lucky clients that have a static IP, you're done. Since I'm not one of those, I still had to configure some kind of DynDNS service to keep my IP address up-to-date in Route 53.
To achieve this, I configured yet another systemd service: [Github link](https://github.com/famzah/aws-dyndns)


### Et Voilà
Using the power of my desktop PC right from the browser, including port forwarding of locally hosted web services. In fact I wrote this whole blog post on my iPad via code-server on my PC. The locally running `0.0.0.0:1111` zola site was automatically served via `1111.XXXXXXXXXX.spiss.dev` behind the same password protection.
And nowadays, I even find myself connecting to the code-server from my Dell XPS 13, as the Desktop PC is just way more powerful, especially when compiling Rust projects ;)

TODO: Picture


