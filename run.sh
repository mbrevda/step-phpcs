#!/bin/bash 
set +e

if hash php 2>/dev/null; then
	info "PHP found"
else
   	fail "PHP not found!"
fi

if [ -z "$WERCKER_PHPCS_DIRECTORY" ];then
    fail 'missing "directory" option, please add this to the phpcs step in your wercker.yml'
fi

if [ -z "$WERCKER_PHPCS_STANDARD" ];then
    info 'missing "standard" option, using PSR2. You can specify the standard in the phpcs step in your wercker.yml'
    WERCKER_PHPCS_STANDARD=PSR2
fi

vendor/bin/phpcs --standard=$WERCKER_PHPCS_STANDARD $WERCKER_PHPCS_DIRECTORY

if [[ $ERR -ne "0" ]]; then
    fail "PHP CodeSniffer failed";
else 
    success "PHP CodeSniffer completed successfully!";
fi

