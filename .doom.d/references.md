


OS desktop manager or shell launches installed port of GNU Emacs that looks for config in certain locations.
It finds Chemacs config in one of those locations.
Chemacs points to config user-emacs-directory by ~/.emacs-profiles.el. It uses "default" profile if none specified.
It points to your config, or Doom config, or Spacemaces config, or...
Doom provides most config but refers to your config which it finds by $DOOMDIR variable or looking in known places. Doom can also store a copy of you environment variables in .local/env.
It finds this ~/.doom.d directory.
The config.el in here loads my personal config in the ~/.emacs.d.mine directory. 

OS -> (desktop window manager or shell) -> GNU Emacs -> Chemacs -> (config 1, config2, config3, ...) -> personal config -> more personal config -> ...

I moved Doom's config from ~/.emacs.d.doom to ~/.config/emacs because it is apparently preferred.
