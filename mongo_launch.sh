#!/usr/bin/env bash
set -e

host="${MONGO_HOST:-localhost}"
port="${MONGO_PORT:-27017}"
username="${MONGO_USERNAME:-}"
password="${MONGO_PASSWORD:-}"
extra_parameters="${MONGO_EXTRA_PARAMETERS:-}"

username_parameter=""
if [[ ! -z "$username" ]]; then
  username_parameter="--username ${username}"
fi

password_parameter=""
if [[ ! -z "$password" ]]; then
  password_parameter="--password ${password}"
fi

exec /usr/bin/mongo ${username_parameter} ${password_parameter} ${extra_parameters} --host ${host} --port ${port}