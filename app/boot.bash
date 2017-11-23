#!/bin/bash

set -e
cd /opt/brimir
bin/rake db:create db:migrate
bundle exec rails s -b 0.0.0.0

