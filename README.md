# .cfg

My dot files

+ follows https://www.atlassian.com/git/tutorials/dotfiles
+ the git-dir is not named ".git"
  + prevents tools like vcs_info from recognizing it
+ doesn't work well with tools like magit that expect the git-dir to be in the working-tree and named ".git"
  

## Set up a new machine
```
git clone --bare git@github.com:kevinjamescasey/.cfg.git ~/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
echo "  fetch = +refs/heads/*:refs/remotes/origin/*" >> .cfg/config
```

If you don't want to use `-uno` often you can run

``` sh
  config config --local status.showUntrackedFiles no
```

## Emacs
GNU Emacs needs to be installed before these configurations can work.

### Spacemacs
```
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d.spacemacs
```
### Doom  

Run

``` sh
~/.installEmacs.sh
```

Or manually...

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
