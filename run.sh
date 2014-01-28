#!/bin/bash 
set +e

if hash php 2>/dev/null
then
	info "PHP found."
else
   	fail "PHP not found!"
fi

if which phpcs
then
    info "PHP CodeSniffer Found."
    PHPCS_PATH="phpcs"
elif [ -f WERCKER_SOURCE_DIR/vendor/bin/phpcs ]
then
    info "PHP CodeSniffer Found."
    PHPCS_PATH="$WERCKER_SOURCE_DIR/vendor/bin/phpcs"
else
    COMPOSER=$WERCKER_STEP_ROOT/composer.json composer install --no-interaction
    PHPCS_PATH="$WERCKER_SOURCE_DIR/vendor/bin/phpcs"
fi

if [ $? -ne "0" ] || [ -z "$PHPCS_PATH" ]
then
    fail "Unable to locate or install PHP CodeSniffer.";
fi

if [ -z "$WERCKER_PHPCS_DIRECTORY" ]
then
    fail "missing 'directory' option, please add this to the phpcs step in your wercker.yml"
fi

if [ -z "$WERCKER_PHPCS_STANDARD" ]
then
    info "missing 'standard' option, using PSR2. You can specify the standard in the phpcs step in your wercker.yml"
    WERCKER_PHPCS_STANDARD="PSR2"
fi

if [ -z "$WERCKER_PHPCS_REPORT" ]
then
    WERCKER_PHPCS_REPORT="full"
fi

if [ -z "$WERCKER_PHPCS_IGNORE" ]
then
    WERCKER_PHPCS_IGNORE=""
else
    WERCKER_PHPCS_IGNORE="--ignore='$WERCKER_PHPCS_IGNORE'"
fi

info "Starting PHP CodeSniffer scanning."
$PHPCS_PATH --extensions=php --standard=$WERCKER_PHPCS_STANDARD --report=$WERCKER_PHPCS_REPORT $WERCKER_PHPCS_IGNORE $WERCKER_PHPCS_DIRECTORY

if [ $? -ne "0" ]
then
    fail "PHP CodeSniffer failed."
else 
    success "PHP CodeSniffer completed successfully!"
fi

