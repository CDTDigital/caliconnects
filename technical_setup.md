
##Setup

###Install ruby

1. if you have a mac, ruby is already installed, however, I suggest using a version manager instead of directly working with your system ruby. this will make it easier to switch between ruby projects that use different versions. RVM and rbenv are both good choices--I use rvm: https://rvm.io/ 

###Install dependencies

Most app dependencies come in the form of gems, which work like npm packages. You'll also need phantomjs available in the environment for running tests. 

1. $ brew install phantomjs
1. $ gem install bundler
1. $ bundle install

###Setup the database

This app expects a running instance of postgres to connect to. It's pretty easy to swap that out for a mysql or something similar if you want to (cloudant and mongo are also options but require separate ORMs)
 
1. Get postgres & start postgres. If you don't already have it installed you can use homebrew to do so. I'm also a fan of the postgres app: https://postgresapp.com/
1. If you're in your dev or test envs, you are good to go. If you're in prod or ci, set your DATABASE_URL variable.
1. $ rake db:create db:migrate

##Run Tests 

$ rspec

##Start the app 

$ rails s

##Deploy to Bluemix

1. modify the app name and host in the manifest. 
2. $ cf push
3. in the bluemix console, bind either an elephant sql or compose postgres instance. once you do, you should be able to navigate to the app and see the base route! 
4. fill in the user-defined DATABASE_URL variable through the bluemix console (you should just need to copy it from the vcap services--you can also modify the database.yml file to pull this value directly from vcap services)

notes:

1. the manifest is set up to automatically run any database migrations you might do in production
1. the cf buildpack only supports a limited number of ruby versions at a time, so the manifest has been locked to the specific buildpack version that includes support for 2.3.3

##Setup a pipeline test stage

1. Paste the contents of the pipeline_test_config file into the configuration of your test stage. 
1. Set the DATABASE_URL variable to the url of a postgres database hosted on Bluemix. 
1. Set the RAILS_ENV variable to "ci"
1. Run the stage!

##Use the pairs file

1. $ gem install pivotal_git_scripts
1. $ git pair $INTIALS

##Env variables allowed:
1. DATABASE_URL (ci and production envs only): the url including credentials of the remote postgres db to connect to. 
1. MAX_THREADS: the number of threads for puma to create per process per instance.
1. WEB_CONCURRENCY: the number of workers for puma to scale out to. each worker can open multiple threads.