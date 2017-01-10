UNDER CONSTRUCTION :3

This is a generic rails setup that includes activerecord and postgres database connection. If you do not want to use activerecord/a sql database, it might be easier to generate a new app with the --skip-activerecord option. This is also a fullstack rails app that includes a frontend. I'll make a separate example that uses the rails 5 api mode!

App specs:

Ruby 2.3.3
Rails 5

This differs from the standard rails app in a few ways:

1. turbolinks are removed
1. there is a ci env set up, in addition to the development, test, and production environments, that expects to run against a remote database
1. specs are set up with rspec and rspec is using poltergeist to run end to end tests 
1. a postgres connection is set up

#Setup

##install ruby

1. if you have a mac, ruby is already installed, however, I suggest using a version manager instead of directly working with your system ruby. this will make it easier to switch between ruby projects that use different versions. 
install rvm
install phantomjs
install pg

1. $ rake db:create db:migrate

#Run Tests 

$ rspec

#Start the app 

$ rails s

#Deploy to Bluemix

1. modify the app name and host in the manifest. 
2. $ cf push
3. in the bluemix console, bind either an elephant sql or compose postgres instance. once you do, you should be able to navigate to the app and see the base route! 
4. fill in the user-defined DATABASE_URL variable through the bluemix console (you should just need to copy it from the vcap services--you can also modify the database.yml file to pull this value directly from vcap services)

notes:

1. the manifest is set up to automatically run any database migrations you might do in production
1. the cf buildpack only supports a limited number of ruby versions at a time, so the manifest has been locked to the specific buildpack version that includes support for 2.3.3

#Setup a pipeline 

#Use the pairs file

1. $ gem install pivotal_git_scripts
1. $ git pair $INTIALS

# env variables allowed:
1. DATABASE_URL (ci and production envs only): the url including credentials of the remote postgres db to connect to. 
1. MAX_THREADS: the number of threads for puma to create per process per instance.
1. WEB_CONCURRENCY: the number of workers for puma to scale out to. each worker can open multiple threads.
