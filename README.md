# PHP-lint check deployment step
Verifies all *.php files in your specified directory

# Dependencies
This build-step depends on an installed php version, if it's mising, the buildstep wil fail.
please either install php, or pick a box wich has php already installed

_please add an pipeline variable wich sets the path, or make it hardcoded in your wercker.yml_

# Options

* `php_directory` the remote directory to upload to


# Example
```yml
box: wercker/php@0.9.5
## Build definition
build:
  # The steps that will be executed on build
  steps:
  - mbrevda/php-lint:
        php_directory: $DIRECTORY
deploy:
  steps:

 ```
