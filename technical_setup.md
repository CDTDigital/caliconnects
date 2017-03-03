##Setup

###Install Ruby and Docker Compose

If these are already installed, skip this step.

1. Ruby: https://www.ruby-lang.org/en/documentation/installation/
1. Docker: https://docs.docker.com/engine/installation/
1. Docker-Compose: https://docs.docker.com/compose/install/

###Start Docker

1. docker-compose build
1. docker-compose up

###Setup the database

With your docker container running, run
 
1. $ docker-compose run web rake db:setup

##Run Tests 

$ docker-compose run web rspec

##Start the app 

$ docker-compose run web rails s

##Env variables expected:

Create a file called .env in the root directory, and set these variables (for syntax click here: https://github.com/bkeepers/dotenv)

1. DATABASE_URL (ci and production envs only): the url including credentials of the remote postgres db to connect to. 
1. MAX_THREADS (optional): the number of threads for the puma webserver to create per process per instance.
1. WEB_CONCURRENCY (optional): the number of workers for the puma webserver to scale out to. Each worker can open multiple threads.
1. SENDGRID_USERNAME and SENDGRID PASSWORD: sendgrid is the smtp server, you will need to setup an account here: https://sendgrid.com/
1. GOOGLE_MAPS_KEY (optional): for the map autocomplete: https://developers.google.com/maps/documentation/javascript/
1. TWILIO_AUTHTOKEN and TWILIO_ACCOUNTSID: for sms messages. Create an account here: https://www.twilio.com/
1. NEW_RELIC_APP_NAME and NEW_RELIC_KEY (optional): for monitoring. Create an account here: https://newrelic.com/