FROM quay.io/continuouspipe/php7-nginx:v1.0

COPY ./tools/docker/usr/ /usr/

USER build

# Add the application
COPY . /app
WORKDIR /app

USER root

# Install dependencies
ARG APP_ENV=
RUN chown -R build:build /app && \
  if [ -n "$APP_ENV" ]; then \
    bash /app/tools/docker/setup/install.sh; \
  fi
