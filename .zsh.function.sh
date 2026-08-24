#!/usr/bin/env sh

# from https://gist.github.com/kevinjamescasey/8e1458ee0cb0ff78a96056713c4c339f
function cdgitroot() {
    cd `git rev-parse --show-toplevel`
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

