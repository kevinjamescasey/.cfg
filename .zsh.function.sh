#!/usr/bin/env sh

# from https://gist.github.com/kevinjamescasey/8e1458ee0cb0ff78a96056713c4c339f
function cdgitroot() {

cd `git rev-parse --show-toplevel`

}

function awsid() {
    aws sts get-caller-identity
    aws iam list-account-aliases 
}
