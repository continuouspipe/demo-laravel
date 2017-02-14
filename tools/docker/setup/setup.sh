#!/bin/bash

set -xe

# Bring in the as_code_owner function, to run commands as the user who owns the code.
# Usually the "build" user.
source /usr/local/share/bootstrap/setup.sh
source /usr/local/share/bootstrap/common_functions.sh

WORK_DIRECTORY="/app";

export DB_CONNECTION=${DB_CONNECTION:-mysql}
export DB_HOST=${DB_HOST:-database}
export DB_PORT=${DB_PORT:-3306}
export DB_DATABASE=${DB_DATABASE:-laravel}
export DB_USERNAME=${DB_USERNAME:-laravel}
export DB_PASSWORD=${DB_PASSWORD:-laravel}
export DB_ROOT_PASSWORD=${DB_PASSWORD:-laravel}

cd "${WORK_DIRECTORY}" || exit 1;
as_code_owner "php artisan migrate"