#!/bin/sh

set -xe

APP_PATH="/app";

# Create new directories
PUBLIC_DIR="${APP_PATH}/public";
STORAGE_DIR="${APP_PATH}/storage";
FRAMEWORK_DIR="${STORAGE_DIR}/framework";
CACHE_DIR="${FRAMEWORK_DIR}/cache";
VIEWS_DIR="${FRAMEWORK_DIR}/views";
SESSIONS_DIR="${FRAMEWORK_DIR}/sessions";

# Create missing storage directories
mkdir -p "${PUBLIC_DIR}";
mkdir -p "${STORAGE_DIR}";
mkdir -p "${FRAMEWORK_DIR}";
mkdir -p "${CACHE_DIR}";
mkdir -p "${VIEWS_DIR}";
mkdir -p "${SESSIONS_DIR}";
