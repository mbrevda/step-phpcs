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

if [ -z "$WERCKER_PHPCS_REPORT" ];then
    $WERCKER_PHPCS_REPORT=full
fi

if [ -z "$WERCKER_PHPCS_IGNORE" ];then
    WERCKER_PHPCS_IGNORE=""
else
    WERCKER_PHPCS_IGNORE="--ignore='$WERCKER_PHPCS_IGNORE'"
fi

if [ ! -f vendor/bin/phpcs ]; then
    fail "could not find phpcs, please add it to your composer.json. See here for more: https://github.com/squizlabs/PHP_CodeSniffer#installation"
fi

vendor/bin/phpcs --standard=$WERCKER_PHPCS_STANDARD --report=$WERCKER_PHPCS_REPORT $WERCKER_PHPCS_IGNORE $WERCKER_PHPCS_DIRECTORY

if [[ $? -ne "0" ]]; then
    fail "PHP CodeSniffer failed";
else 
    success "PHP CodeSniffer completed successfully!";
fi

