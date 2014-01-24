# PHP CodeSniffer Wercker step
Verifies all *.php files specified directory

[![wercker status](https://app.wercker.com/status/85b2f64a4a96aa882c71cff384289677 "wercker status")](https://app.wercker.com/project/bykey/85b2f64a4a96aa882c71cff384289677)

# Dependencies
* PHP - This build-step depends on an installed php version, if it's missing, the buildstep will fail. Please either install php, or pick a box which has php already installed
* PHPCS - Information on installing phpcs is available at https://github.com/squizlabs/PHP_CodeSniffer#installation

# Options

* `directory` The directory(s)/file(s) to scan. _please add a pipeline variable which sets the path, or make it hardcoded in your wercker.yml_
* `ignore` The directory(s)/file(s) to ignore.
* `standard` The coding standard used to test against; defaults to PSR2.
* `report` Sets the output display format. http://pear.php.net/manual/en/package.php.php-codesniffer.reporting.php

# Example
```yml
box: wercker/php
## Build definition
build:
  # The steps that will be executed on build
  steps:
  - mbrevda/phpcs:
        directory: $DIRECTORY
        standard: PSR2
        ignore: $IGNORE_DIRECTORY
        report: full
deploy:
  steps:

 ```
