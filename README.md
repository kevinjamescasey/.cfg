# .cfg

My dot files

https://www.atlassian.com/git/tutorials/dotfiles

## Set up a new machine
```
git clone --bare git@github.com:kevinjamescasey/.cfg.git ~/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
echo "  fetch = +refs/heads/*:refs/remotes/origin/*" >> .cfg/config
```

## Emacs
GNU Emacs needs to be installed before these configurations can work.

### Spacemacs
```
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d.spacemacs
```
### Doom  
Follow https://github.com/doomemacs/doomemacs?tab=readme-ov-file#prerequisites to install Emacs and other utilities used by Doom.
```
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d.doom
~/.emacs.d.doom/bin/doom install
```

## VSCode

Link the official file path location to the dot files

### macOS

``` sh
ln -s ~/.vscode.keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/.vscode.settings.json ~/Library/Application\ Support/Code/User/settings.json
```
