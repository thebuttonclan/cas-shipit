#!/bin/sh

set -e

command=$1

case $command in
  setup)
    bundle exec rake railties:install:migrations db:create db:migrate
    exit 0
    ;;
  upgrade)
    bundle exec rake railties:install:migrations db:migrate
    exit 0
    ;;
esac

exec "$@"