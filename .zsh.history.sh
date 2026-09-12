# from https://www.soberkoder.com/better-zsh-history/

export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTFILE=~/.zsh_history

setopt HIST_FIND_NO_DUPS # ctrl-R avoids showing duplictes
# following should be turned off, if sharing history via setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY # record hisotry after every command
