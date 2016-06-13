source "https://rubygems.org"
ruby "2.3.1"

gem 'rack_csrf', '~> 2.5'
gem 'sinatra', '~> 1.4', '>= 1.4.7'
gem 'thin', '~> 1.7'

gem 'activerecord', '~> 4.2', '>= 4.2.6'
gem 'sinatra-activerecord', '~> 2.0', '>= 2.0.9'

group :development do
  gem 'rake', '~> 11.2', '>= 11.2.2'
  gem 'sinatra-reloader', '~> 1.0'
  gem 'dotenv', '~> 2.1', '>= 2.1.1'
  gem 'pry', '~> 0.10.3'
  gem 'pry-coolline', '~> 0.2.5'
end

group :test do
  gem 'contest', '~> 0.1.3'
  gem 'test-unit', '~> 3.1', '>= 3.1.9'
  gem 'minitest', '~> 5.1'
end

group :development, :test do
  gem 'sqlite3', '~> 1.3', '>= 1.3.11'
end
