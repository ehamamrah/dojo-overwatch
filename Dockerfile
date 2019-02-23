FROM ruby:2.4.2
MAINTAINER Elayan Hamamrah <elayan.hr@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /dojo-on-docker
WORKDIR /dojo-on-docker
ADD Gemfile /dojo-on-docker/Gemfile
ADD Gemfile.lock /dojo-on-docker/Gemfile.lock
RUN bundle install
RUN bundle exec rails db:create
RUN bundle exec rails db:migrate
RUN rm -f tmp/pids/server.pid
ADD . /dojo-on-docker
