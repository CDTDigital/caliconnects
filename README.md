This is a generic rails setup that includes activerecord and postgres database connection. If you do not want to use activerecord/a sql database, it might be easier to generate a new app with the --skip

This differs from the standard rails app in a few ways:

- turbolinks are removed
- there is a ci env set up, in addition to the development, test, and production environments
- specs are set up with rspec and rspec is using poltergeist to run end to end tests 
- a postgres connection is set up

#Setup

install rvm
install phantomjs
install pg

1. $ rake db:create db:migrate

#Run Tests 

$ rspec

#Start the app 

$ rails s

env variables allowed:
DATABASE_URL (prod only): the url including credentials of the remote postgres db to connect to. 
MAX_THREADS: the number of threads for puma to create per process per instance (
