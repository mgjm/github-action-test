#!/bin/sh -e

section() {
	echo "##[section]$@"
}

set_env() {
	echo "$1=$2"
	echo "::set-env name=$1::$2"
}

command() {
	echo "##[command]$@"
	"$@"
}

workdir() {
	if [ ! -d "$1" ]; then
		command mkdir -p "$1"
	fi
	command cd "$1"
}

run() {
	echo "##[group]$@"
	local code=0
	("$@") || code=$?
	echo "##[endgroup]"
	return $code
}

runsh() {
	echo "##[group]$1"
	local code=0
	(sh -c "$1") || code=$?
	echo "##[endgroup]"
	return $code
}


section ---------------- A ----------------
run date

section ---------------- B ----------------
runsh 'date > demo/my-artifact-123.txt'

section ---------------- C ----------------
set_env ASSET_PATH "$PWD/demo/my-artifact-123.txt"
set_env ASSET_NAME "my-artifact-123-$1.txt"
