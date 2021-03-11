# .cfg
My dot files

https://www.atlassian.com/git/tutorials/dotfiles

## Emacs
```
git clone --bare git@github.com:kevinjamescasey/.cfg.git ~/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
echo "  fetch = +refs/heads/*:refs/remotes/origin/*" >> .cfg/config
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d.spacemacs
```

```
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d.spacemacs
```

```
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d.doom
~/.emacs.d.doom/bin/doom install
```
