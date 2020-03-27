#!/bin/sh -e

section() {
	echo "##[section]$@"
}

run() {
	echo "##[group]$@"
	local code=0
	("$@") || code=$?
	echo "##[endgroup]"
	return $code
}

section ---------------- Install dependencies ----------------
run 
run echo 123

section demo-end
run true

echo "::set-env name=ARTIFACT_NAME::demo-0.1.0.test.txt"
run sh -c 'date > artifact.txt'

section demo-end2
