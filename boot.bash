#!/bin/bash

set -e 
cd /opt/brimir 
bin/rake db:create db:schema:load assets:precompile 
bundle exec rails s -b 0.0.0.0

