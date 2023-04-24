# from https://www.themoderncoder.com/add-git-branch-information-to-your-zsh-prompt/
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %b '
setopt PROMPT_SUBST

if [[ "$TERM" == "dumb" ]]; then
  # No terminal escape sequences, only prompt escapes
    PS1='\D{%F} \t \u at \h in \w\n\$ '
    echo "dumb terminal"
else
    # Assuming a rich terminal, using terminal escape sequences
    #DEFAULT_PS1='\[\033[01;32m\]\D{%F} \t \[\033[1;31m\]\w\[\033[01;34m\]\$ \[\033[00m\]'
    DEFAULT_PS1='%t %K{cyan}%F{black}%~%k%f%F{magenta}${vcs_info_msg_0_}%f%F{cyan}>%f'
    PS1="$DEFAULT_PS1"
fi

simplePrompt() {
    PS1=">"
}

sharingPrompt() {
    echo "Running on $(uname -sr)"
    PS1="\t> "
}

sharingPrompt2() {
    echo "Running on $(uname -sr)"
    PS1="%t> "
}

defaultPrompt() {
    PS1="$DEFAULT_PS1"
}

standardPrompt() {
    PS1='%F{magenta}%D %* %~>%f'
}
