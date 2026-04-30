#!/usr/bin/env sh

# open files in Emacs from shell
alias e='emacsclient -n'
alias emax='emacsclient -n'

# pipe output to new buffer
# example: ls | ebuf
ebuf() {
  local temp=$(mktemp)
  cat > "$temp"
  # Open in Emacs, then rename buffer to something useful and remove file association
  emacsclient -n -e "(progn (find-file \"$temp\") (set-visited-file-name nil) (rename-buffer \"*piped-output*\" t))"
  rm "$temp"
}

