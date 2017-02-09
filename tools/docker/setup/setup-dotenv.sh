#!/bin/sh

set -xe

ENV_FILE="/app/.env";

if [ ! -f "$ENV_FILE" ]; then
  touch "$ENV_FILE"
fi

{
  echo "APP_ENV=${APP_ENV:-production}";
  echo "APP_KEY=${APP_KEY:-base64:OQ8H9vjocvQh284ojDBrODQ2HkrgWGDvdLCaQniHz0M=}";
  echo "APP_DEBUG=${APP_DEBUG:-false}";
  echo "APP_URL=${APP_URL:-https://laravel-demo.dev}";

  echo "DB_CONNECTION=${DB_CONNECTION:-mysql}";
  echo "DB_HOST=${DB_HOST:-database}";
  echo "DB_PORT=${DB_PORT:-3306}";
  echo "DB_DATABASE=${DB_DATABASE:-laravel}";
  echo "DB_USERNAME=${DB_USERNAME:-laravel}";
  echo "DB_PASSWORD=${DB_PASSWORD:-laravel}";

  echo "MAIL_DRIVER=${MAIL_DRIVER:-smtp}";
  echo "MAIL_HOST=${MAIL_HOST:-mailtrap.io}";
  echo "MAIL_PORT=${MAIL_PORT:-2525}";
  echo "MAIL_USERNAME=${MAIL_USERNAME:-null}";
  echo "MAIL_PASSWORD=${MAIL_PASSWORD:-null}";
  echo "MAIL_ENCRYPTION=${MAIL_ENCRYPTION:-null}";

  echo "CACHE_DRIVER=${CACHE_DRIVER:-redis}";
  echo "SESSION_DRIVER=${SESSION_DRIVER:-redis}";
  echo "QUEUE_DRIVER=${QUEUE_DRIVER:-database}";

  echo "REDIS_HOST=${REDIS_HOST:-redis}";
  echo "REDIS_PASSWORD=${REDIS_PASSWORD:-null}";
  echo "REDIS_PORT=${REDIS_PORT:-6379}";

} >> "${ENV_FILE}";

# Allow the web server user to read this file in, and the build user to run `php artisan key:generate`
chown "${CODE_OWNER}":"${APP_GROUP}" "${ENV_FILE}"
chmod 640 "${ENV_FILE}"
