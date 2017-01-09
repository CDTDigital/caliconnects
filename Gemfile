source 'https://rubygems.org'

ruby "2.3.3"

gem 'rails', '~> 5.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Devise for User Auth
# gem 'devise'

# Use HTTParty for HTTP calls
# gem 'httparty'

group :development, :test, :ci do
  # capybara gives you friendly syntax for end-to-end selenium tests
  gem 'capybara'
  # database cleaner insures a clean database state in between tests
  gem 'database_cleaner'
  # dotenv lets you use a git ignored .env file to manage your environment
  gem 'dotenv-rails'
  # factory girl gives you efficient creation of test data based on your models
  # gem 'factory_girl_rails'
  # launchy lets you take screenshots for debugging capybara tests
  gem 'launchy'
  # poltergeist is a headless runner for your capybara tests based on phantomjs, great for pipeline environments!
  gem 'poltergeist'
  # pry-byebug improves the standard ruby debugger
  gem 'pry-byebug'
  # rspec is your primary testing library
  gem 'rspec-rails'

  # gem 'selenium-webdriver'
  # gem 'shoulda-matchers'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  # the 12factor gem helps ensure your assets get compiled correctly and your logs come through right in the cloud
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
