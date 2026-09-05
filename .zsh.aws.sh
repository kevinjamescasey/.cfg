#!/usr/bin/env sh

function awsShellConfig() {
    # aws CLI completion (https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-completion.html)
    # program at /usr/local/bin/aws_completer
    export PATH=/usr/local/bin/:$PATH
    autoload bashcompinit && bashcompinit
    complete -C '/usr/local/bin/aws_completer' aws
}

