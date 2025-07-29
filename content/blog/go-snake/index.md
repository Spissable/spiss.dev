+++
title = "Go Snake - Having a little fun"
date = 2024-05-04
description = "Recently I started learning Go, due to a little career switch. What better way to get the ball rolling than playing around with a little Go game engine."

[extra]
footnote_backlinks = true
quick_navigation_buttons = true
+++

## The Game

The game is a super simplistic version of the good ol' snake, written with the Go game engine [Ebitengine](https://ebitengine.org) and compiled to WebAssembly, so you can enjoy it in its full glory right from this blog post.

### Some hot-keys:

- `<Arrow keys>` - Navigate the snake
- `<Esc>` - Pause the game
- `<r>` - Restart the game
- `<w>` - Toggle walls on/off (only if you have 0 points)

P.S. You have to first click on the visible game area for the input keys to work.

{{ game(url="https://snake.spiss.dev", class="go-snake") }}

### Conclusion

It's really nothing fancy, but as someone who primarily learns by doing, it's a cool little project to hack on and get familiar with some Go concepts. Feels almost like high school again when I was first introduced to Java and programming in general and I started emulating some tiny games.
