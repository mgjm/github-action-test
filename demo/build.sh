#!/bin/sh -e

section() {
	echo "##[section]$@"
}

run() {
	echo "##[command]$@"
	echo "##[group]Execute $1"
	local code
	"$@"; code=$?
	echo "##[endgroup]"
	return $code
}

section demo
run echo 123

section demo-end
run false

section demo-end2
