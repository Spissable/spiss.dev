+++
title = "Fish Shell - 90s shell for a 90s kid"
date = 2023-11-18
updated = 2023-11-18
description = "Years ago I installed the fish shell and simply stuck with it, without ever really thinking about it much again. Maybe it's time to finally reflect on why."

[extra]
footnote_backlinks = true
quick_navigation_buttons = true
+++

### Backstory
Many years ago, in the early days of my professional career, I remember looking over my on-boarding buddy's shoulders. What caught my eye was his terminal, which looked far different from the standard terminal running pure bash. This is how I got introduced to _zsh_ and _ohmyzsh_.

Many config changes and installed plugins later, I was delighted with my shiny-looking terminal. However, as a chronic distro-hopper, I already started looking for other tools that I haven't heard about.

### Fish
Soon I came across fish. I have to admit, I wasn't impressed by the website, but I was more than happy to look past that. And for the better.
The main thing that struck me was the out-of-the-box experience. I had everything I ever wanted and more, without a single config change, or a single plugin. Some of these are:
- Case insensitive auto-complete
- Git integration
- Responsiveness

The only real config changes that I eventually made were un-setting the greeting message:

```
set fish_greeting
```

and adding a bunch of folders to the path:

```
set -gx PATH "$HOME/.cargo/bin" $PATH
```

### A long boring time later
And here I am now, in 2023, still completely happy with my fish shell experience. I guess it's just the right amount of features and old-school
familiarity that has kept me happy for so long. Or perhaps I'm just getting old 😅.

That being said, I'm sure there are new shiny things on the horizon (like [Warp](https://www.warp.dev)) that I'll give a try, especially now in the times of generative AI.