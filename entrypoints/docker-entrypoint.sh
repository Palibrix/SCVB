#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

rake db:create
rake db:migrate
rake db:seed
bundle exec rails s -b 0.0.0.0
