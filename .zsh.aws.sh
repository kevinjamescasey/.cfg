#!/usr/bin/env sh

function awsShellConfig() {
    # aws CLI completion (https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-completion.html)
    # program at /usr/local/bin/aws_completer
    export PATH=/usr/local/bin/:$PATH
    autoload bashcompinit && bashcompinit
    complete -C '/usr/local/bin/aws_completer' aws
}

function awsid() {
    aws sts get-caller-identity
    aws iam list-account-aliases 
}

function awsIamErrorDecode() {
    # need aws and jq installed
    # need to be logged in
    local encoded_message="$1"
    decoded_message=$(AWS_REGION=us-east-1 aws sts decode-authorization-message --encoded-message "$encoded_message")
    echo $decoded_message|jq -r .DecodedMessage |sed 's/\\"/"/g'|jq
}



