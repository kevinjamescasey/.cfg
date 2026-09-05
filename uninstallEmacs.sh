#!/usr/bin/env sh -x

rm -rf ~/Applications/Emacs.app/ # mac GUI launcher

rm -rf ~/.emacs.d.doom # old Doom location
rm -rf ~/.config/emacs # Doom location

brew uninstall git ripgrep coreutils fd libvterm emacs-mac shellcheck fontconfig shfmt
brew uninstall --cask font-symbols-only-nerd-font

npm unisntall -g prettier marked

rm -rf ~/.emacs.d     #one of the defaul GNU Emacs config locations where I keep Chemacs
rm -rf ~/.emacs.d.gnu # location where I tend to backup the default config that GNU Emacs generates
