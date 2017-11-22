FROM agideo/ruby:2.3-f

ENV RAILS_ENV=production
RUN set -ex \
  && cd /opt/ \
  && curl -L -O https://github.com/ivaldi/brimir/archive/0.7.3.zip \
  && apt-get update \
  && apt-get install unzip \
  && unzip 0.7.3.zip \
  && mv brimir-0.7.3 brimir \
  && rm -rf 0.7.3.zip \
  && cd brimir \
  && bundle install \
  && sed -i "s/<%= ENV\[\"SECRET_KEY_BASE\"\] %>/`bin/rake secret`/g" config/secrets.yml \
  && copy database.yml config/database.yml \
  && copy nginx.conf /etc/nginx/conf.d/default.conf \
  && bin/rake db:create db:schema:load assets:precompile