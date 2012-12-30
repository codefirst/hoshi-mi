source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem 'json'
gem 'uuidtools'
gem 'devise'
gem 'omniauth-twitter'

gem 'sass-rails',   '~> 3.2.3'
gem 'haml-rails',   '~> 0.3.4'
gem 'less-rails'
gem 'twitter-bootstrap-rails',   '~> 2.1.6'
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
