#!/bin/bash

set -xe

# Source variables such as what user the site will be running as
source /usr/local/share/bootstrap/setup.sh

# Bring in the composer running function
source /usr/local/share/php/common_functions.sh

APP_PATH="/app";

# Create missing directories
/app/tools/docker/setup/setup-directories.sh

# Install the app
cd "${APP_PATH}" || exit 1;

run_composer

chown -R "${CODE_OWNER}:${APP_GROUP}" bootstrap/cache/ storage
chmod -R ug+rw,o-w bootstrap/cache/ storage/
chmod +x storage
