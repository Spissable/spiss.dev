+++
title = "Giving Clear Linux a Try"
date = 2020-03-01T13:00:00+01:00

# [extra]
# updated = 2020-03-01T13:00:00+01:00
+++

After over a year of exclusively using Arch Linux on my work laptop, the distro hopping itch has gotten the better of me and I decided to give [Clear Linux](https://clearlinux.org/) a try. And since I don't do half arsed things, I wiped my disk and used Clear Linux as my main distro... at least for a while.

<!-- more -->

###  Installation
The installation experience was very straight forward, similar to the one of Ubuntu I'd say. The graphical interface leaves next to no room for mistakes and presents you with a ready-to-go system with just a few clicks.

The only thing I was missing was F2FS (Flash-Friendly File System) support, which is my preferred filesystem. However, at the time of me writing this post, a pull request adding support for it has been [merged](https://github.com/clearlinux/clr-installer/pull/654#event-3079095310). 

###  The Good
The very first thing I noticed when booting Clear Linux, was actually the boot process itself. It is *blazing fast*! Despite full root encryption. I also found confirmation of that impression [here](https://phoronix.com/scan.php?page=news_item&px=Clear-Linux-Kernel-3s-to-300ms).

Since the default desktop environment of the distro is Gnome, I was then greeted by the Gnome Desktop Manager. A choice I very much support, as Gnome gives a very complete desktop experience in my opinion, including support for X11 and Wayland.

Last but not least, all the software I installed was up-to-date, which is one of the big promises on the distros website.

### The Bad
While the software I installed was up-to-date, it still cost me quite some frustration. Clear Linux offers a lot of its packages in bundles, e.g. the desktop-dev bundle, which includes lots of different packages which you might need or might not. As for me, I prefer being in control of what is being installed, rather than having to get a whole bundle of things of which half of it is useless to me.

Another packaging format that is supported is [Flatpak](https://flatpak.org/). A containerized, distribution independent packaging format which claims to be "The Future Of Apps On Linux." As they offer Visual Studio Code, which is my main code editor, I gave it a try. First problem, the integrated terminal was not working as I was used to. The Z shell didn't respect my config files, certain executables weren't usable... and I am [not the only one](https://github.com/Microsoft/vscode/issues/44646).

Last but not least, only 1 week into the experiment, my Gnome Wayland setup didn't load anymore, but instead I was greeted with a black screen on log-in. The X11 variant still worked though, so I tried to repair it from there. However, attempt after attempt the frustration grew bigger and bigger and I really need my system to be reliable at work, so I just decided to pull the plug and re-install the trusted Arch Linux.

### Conclusion
I am still glad I gave Clear Linux a try and despite the problems that I faced, I am still very impressed how far this very young distro has come. Especially the performance is astonishing, and I hope other distros can integrate some of Clear Linux's patches. I can't wait to try out the next up and coming distro, whichever it might be.