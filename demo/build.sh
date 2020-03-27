#!/bin/sh -e

section() {
	echo "##[section]$@"
}

run() {
	echo "##[command]$@"
	echo "##[group]Execute $1"
	local code
	if "$@"; then
		:
	fi
	code=$?
	echo "##[endgroup]"
	echo "CODE=$code"
	return $code
}

section demo
run echo 123

section demo-end
run true

section demo-end
run false

section demo-end2
