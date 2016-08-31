source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'

# User postgresql as our RDBMS
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library (requested from bower)
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc',         group: :doc

# Elasticsearch
gem 'elasticsearch-model'
gem 'elasticsearch-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]

gem "bower-rails"

group :test do
  gem "selenium-webdriver"  # Web page interaction
  gem "capybara"  # For integration testing.
  gem "webmock"   # Allows mocking of web apis for instance
  gem 'elasticsearch-extensions'  # test cluster functionality
end

group :test, :development do
  gem "rspec-rails"                       # Rspec
  gem "guard-rspec"                       # Integrate Guard with Rspec
  gem "guard-spring"                      # Integrate Guard with Spring
  gem "shoulda-matchers", '2.8.0'         # Really handy RSpec matchers not included with RSpec
  gem "database_cleaner"                  # Allows isolated testing of DB interactions.
  gem 'spring-commands-rspec', group: :development
end

# Installed outside of environments to allow access in production. If you don't want this just put it
# in group :development, :test
gem "factory_girl_rails"                  # Creates factories for models
gem 'faker'                               # Handy for creating fake data

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read     more:         https://github.com/rails/spring
  gem 'spring'
end
