#!/bin/sh -e

section() {
	echo "##[section]$@"
}

run() {
	echo "##[command]##[group]Execute $1"
	echo "##[endgroup]"
	echo "##[group]##[command]Execute $1"
	echo "##[endgroup]"

	echo "##[command]$@"
	echo "##[group]Execute $1"
	local code=0
	("$@") || code=$?
	echo "##[endgroup]"
	return $code
}

section demo
run echo 123

section demo-end
run true

section demo-end
run false

section demo-end2
