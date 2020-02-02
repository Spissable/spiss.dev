+++
title = "i3wm - the world of tiling window managers"
date = 2019-05-25T15:42:29+11:00

# [extra]
# updated = 2019-05-25T22:40:53+10:00
+++

Disclaimer: If you prefer your system to be production ready right away, shiny to the very last pixel and intuitive without spending some time to get used to it, then i3 is most likely not for you. For anyone else, enjoy the post and I hope you'll give it a try yourself! 

<!-- more -->

###  Floating vs. Tiling
The window manager landscape for the Linux ecosystem is quite crowded. Major names like Gnome, KDE or XFCE satisfy most users' needs and give a lot of room for customization. One feature that unites them is, that they are all floating window managers. It's the concept of dragging windows around freely (mostly with your mouse), probably everyone is familiar with from using Windows or MacOS. 

On the other side, there are tiling window managers like i3, awesome or herbstluft, just to name a few. They are way less popular amongst the average user, but the concept of automatically tiling windows by default, not just helps you to stay organized, but enforces it. And once you get accustomed to it, you'll find your workflow to be vastly improved in speed. 

###  i3wm
i3wm is my window manager of choice for some years now whenever I'm working on a Linux machine. Initially I encountered it during a presentation at the university. I had been using Linux for years at that point, but I wasn't familiar with the concept of tiling window managers. Clearly impressed, I installed it right away and well... it was a game changer. A few of the main features (for me):

- Tiling (duh.)
- Binding applications to workspaces
- Horizontal / Vertical / Tabbed / Stacked / Floating
- Configuration in a single config file

###  Binding applications to workspaces
In order to stay truly organized in a tiling window manager environment, it's quite fundamental that your windows open in pre-defined workspaces. Otherwise your screen would become really crowded, really fast. This is how I organize my workspaces:

1: Browsers

2: Editors

3: Terminals

4: Communication

5: Music

Scratchpad: Notes

With this setup, I got my everyday needs covered. It became second nature to me and going back to any other window manager without this feature (which I occasionally do, because I love to experiment) is just a pain in the ass.

### Configuration
All keybinds, workspaces etc. are configured in one config file (~/.config/i3/config). While this might be a little bit intimidating at first, it becomes more and more advantageous with time. i3 has a great documentation for beginners, making it actually quite easy to tailor the window manger the way you like it. And once configured, you can just backup your configuration file and have it ready whenever you decide to install a new OS.

### Additional tools

**Polybar:** Alternative, feature rich and beautiful statusbar

**Rofi:** Application launcher, window switcher and much more

**Udev rule + systemd service + bash script:** to properly manage monitor hotplug

### Helpful ressources

[i3 documentation](https://i3wm.org/docs/)

[Sway (wayland implementation of i3)](https://swaywm.org/)

[Subreddit for inspiration](https://www.reddit.com/r/unixporn/)

[My dotfiles](https://github.com/Spissable/dotfiles/)