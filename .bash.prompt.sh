DEFAULT_PS1="$PS1"

defaultPrompt() {
    PS1="$DEFAULT_PS1"
}

simplePrompt() {
    PS1=">"
}

sharingPrompt() {
    echo "Running on $(uname -sr)"
    PS1="\t> "
}
