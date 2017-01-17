#!/bin/bash

sudo apt-get update

command curl -sSL https://rvm.io/mpapis.asc | gpg --import -

curl -sSL https://get.rvm.io | bash -s stable

source /home/pipeline/.rvm/scripts/rvm

rvm install 2.3.3

RAILS_ENV="${RAILS_ENV:-test}"
export RAILS_ENV

gem install bundler

bundle

rspec