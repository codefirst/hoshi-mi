source 'https://rubygems.org'

gem 'rails', '3.2.11'

gem 'json'
gem 'uuidtools'
gem 'settingslogic'
gem 'devise'
gem 'omniauth-twitter'
gem 'omniauth-redmine', :github => 'suer/omniauth-redmine'

gem 'sass-rails',   '~> 3.2.3'
gem 'haml-rails',   '~> 0.3.4'
gem 'less-rails'
# 2.1.9 with 1.8 compatibility fix
gem 'twitter-bootstrap-rails', :github => 'seyhunak/twitter-bootstrap-rails', :ref => 'b126c86a57fd0512e296be9f73b0613c34a89bfb'
gem 'jquery-rails', '~> 2.0.2'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'spork'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'rb-fsevent'
end

platform :ruby do
  gem 'thin'
  gem 'therubyracer'
  gem 'newrelic_rpm'

  group :postgresql do
    gem 'pg'
  end

  group :test, :development do
    gem 'sqlite3'
  end
end

platform :jruby do
  gem 'puma'
  gem 'therubyrhino'

  group :postgresql do
    gem 'activerecord-jdbcpostgresql-adapter'
  end

  group :test, :development do
    gem 'activerecord-jdbcsqlite3-adapter'
    gem 'warbler'
  end
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
