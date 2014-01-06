# PHP CodeSniffer Wercker step
Verifies all *.php files specified directory

[![wercker status](https://app.wercker.com/status/85b2f64a4a96aa882c71cff384289677 "wercker status")](https://app.wercker.com/project/bykey/85b2f64a4a96aa882c71cff384289677)

# Dependencies
This build-step depends on an installed php version, if it's missing, the buildstep will fail.
Please either install php, or pick a box which has php already installed

_please add a pipeline variable which sets the path, or make it hardcoded in your wercker.yml_

# Options

* `directory` the directory to upload to
* `standard` the coding standard used to test agains; defaults to PSR2

# Example
```yml
box: wercker/php@0.9.5
## Build definition
build:
  # The steps that will be executed on build
  steps:
  - mbrevda/phpcs:
        directory: $DIRECTORY
        standard: PSR2
deploy:
  steps:

 ```
