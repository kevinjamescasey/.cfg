#!/usr/bin/env sh

function cdgitroot() {

cd `git rev-parse --show-toplevel`

}
