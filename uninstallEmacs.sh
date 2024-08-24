#!/usr/bin/env sh -x

rm -rf ~/Applications/Emacs.app/

rm -rf ~/.emacs.d.doom

brew uninstall git ripgrep coreutils fd libvterm emacs-mac

rm -rf ~/.emacs.d
rm -rf ~/.emacs.d.gnu
