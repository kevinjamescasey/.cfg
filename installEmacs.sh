#!/usr/bin/env sh -x

#follow https://github.com/doomemacs/doomemacs/blob/master/docs/getting_started.org#on-macos

#install necessary dependencies
brew install git ripgrep
brew install coreutils fd

#install desired dependencies
# needed for vterm
brew install libvterm
# needed for Emacs Doom markdown-preview
npm install -g marked
# needed for Emacs Doom shell linting
brew install shellcheck
#needed for Emacs Doom :editor format ...but didn't work yet
npm install -g prettier


#install emacs
brew tap railwaycat/emacsmacport
brew install emacs-mac --with-modules

# install doom
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d.doom
~/.emacs.d.doom/bin/doom install --force
~/.emacs.d.doom/bin/doom sync --force

# mv gnu emacs
[ -f ~/.emacs ] && mv ~/.emacs ~/.emacs.bak
[ -d ~/.emacs.d ] && mv ~/.emacs.d ~/.emacs.gnu

# install chemacs
git clone https://github.com/plexus/chemacs2.git ~/.emacs.d

# create gui launcher by following https://github.com/railwaycat/homebrew-emacsmacport/blob/master/docs/emacs-start-helpers.md#helper-2
cd ~/Applications/
osacompile -o Emacs.app -e "tell application \"Finder\" to open POSIX file \"$(brew --prefix)/opt/emacs-mac/Emacs.app\""
