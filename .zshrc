echo "loading .zshrc for interactive shell" 
# enables zsh's profiling
# many things need to be in functions to be included in profiling
#zmodload zsh/zprof

# exports appending to PATH may be better in .zprofile to avoid repating the appends in subshells
# things that take a long time may be better in .zprofile since it doesn't run as often

# zmsg() {
#   ZLOGS+=("$1: $((SECONDS * 1000)) ms")
# }

function usualShellConfig() {
	. ~/.zsh.history.sh
	. ~/.zsh.prompt.sh
	. ~/.zsh.alias.sh
	. ~/.zsh.git.sh
	. ~/.zsh.emacs.sh
	. ~/.zsh.emacs-term.sh
}
usualShellConfig
# zmsg 'completed usual customizations'

# Place this directly inside your load_deferred_completions function
# It limits compinit checking to once every 24 hours
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1) ]]; then
	compinit -C
else
	compinit -i
fi
# zmsg 'completed initialization of zsh completion system'

. ~/.zsh.brew.sh
homebrewShellConfig
# zmsg 'completed homebrew config'

. ~/.zsh.aws.sh
awsShellConfig
# zmsg 'completed aws autocomplete'

# zmsg 'completed final cusomizations'

# print -rl -- "--- Zsh Startup Timings ---" $ZLOGS
#zprof # shows zsh's profiling information
