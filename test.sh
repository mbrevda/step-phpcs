#!/bin/bash
#PS4='+($?) $BASH_SOURCE:$FUNCNAME:$LINENO:'

#test script to mimic fail/warning/info handlers for wercker locally

export WERCKER_PHPCS_DIRECTORY="./src"
GENERATED_BUILD_NR="1"

info() {
	echo "info: $1"
}

warning() {
	echo "warning: $1"
}

success() {
	echo "success: $1"
	exit 0;
}

fail() {
	echo "Failing with: $1"
	exit 1;
}

. run.sh

RESULT=$?
if [[ $RESULT -ne "0" ]] || [[ $GENERATED_BUILD_NR != "1" ]]; then
    echo "Test: FAIL -> $RESULT"
    return 1 2>/dev/null || exit 1
else
	echo "done"
fi
