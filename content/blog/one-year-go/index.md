+++
title = "One Year of Go"
date = 2025-07-29
description = "A little over a year ago I started a new endeavour in a new backend role and a new programming language, Go. I figured I'd take the occasion now and have a little recap of the experience thus far."

[extra]
footnote_backlinks = true
quick_navigation_buttons = true
+++

### The Start

While I'm sure there are more qualified people out there to give recommendations and suggestions on how to best get started with Go,
there is one resource that I keep recommending to everyone: [100 Go Mistakes and How to Avoid Them
](https://100go.co).
I can't overstate how positive an influence this book has been for me and how much of a head start it gave me. Take this from someone
who generally isn't too keen on reading technical books.

### The Positives

I'll keep it quick and to the point—some of the things I've enjoyed about Go and its ecosystem over the past year:

- **Simplicity**: Coming from Node.js/TypeScript where one codebase can look completely upside-down compared to the next, Go repos just look all _the same_, relatively speaking.
  There is usually one idiomatic way of doing things, and the standard library gets you mostly there. Bye bye JS framework flavor of the week.
- **Stability**: I can barely remember the last time I had a Dependabot update and something actually broke. And when it did, it was a major version with relevant release notes. Go updates are
  painless, given the promise of no breaking changes.
- **Improvements**: After mentioning how stable something is, one could expect it comes at the expense of improvements being shipped. But it doesn't feel like that's the case. Shipped with [Go 1.24](https://go.dev/blog/go1.24),
  there is now a great built-in way of dealing with tools, and with the upcoming 1.25 the [synctest](https://go.dev/blog/synctest) feature is coming out of the "experimental phase"—just to mention a couple of awesome improvements.

### The Negatives

On the flip side, there are of course some negatives as well:

- **Zero Initialization**: I'm sure some smart people have really good arguments about this. But so far I can't wrap my head around why this is the way to go (pun intended).
- **Mocking**: Writing interfaces for the sole purpose of having a way of mocking them—using a 3rd party package. I don't think I need to elaborate.
- **Rawness**: Some things could just use a fresh coat of paint to make them a bit more user-friendly right out of the box. One thing that comes to mind specifically is the `go test` output. The raw out-of-the-box experience is just not good. Luckily there is the [gotestsum](https://github.com/gotestyourself/gotestsum) package.

### GopherCon EU 2025

Finally, I also had the chance to visit GopherCon EU this year, and it's an experience I can wholeheartedly recommend. Lots of interesting talks, passionate people, and all in all just great vibes.

{{ dimmable_image(src="blog/one-year-go/img/gophercon.jpeg", alt="Gopher Eating Microsoft Logo") }}
