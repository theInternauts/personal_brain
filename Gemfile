source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'json'
gem 'slim'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'unicorn'
gem 'sanitize'
gem "ember-rails"


group :development, :test do
	gem "rspec-rails", '~> 2.13.2'
  gem 'fabrication', '2.11.3'
  gem 'json_spec', '~> 1.0.3'
  gem 'irake'
  gem 'ruby-prof'
	# Use debugger
	# gem 'debugger'
end
group :development do
	# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
	gem 'spring'
  gem 'byebug'
  gem 'foreman'
	gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
	# Use Capistrano for deployment
	# gem 'capistrano-rails'
end

group :test do
  gem "ffaker"
  gem "timecop", :require => false
  gem 'fakeweb', :require => false
  gem 'spork', '1.0.0rc4'
  gem 'database_cleaner', :require => false
  gem "rspec-instafail", :require => false
  gem "webmock"
  gem "webrat"
  gem "shoulda-matchers"
end

group :doc do
	# bundle exec rake doc:rails generates the API under doc/api.
	gem 'sdoc', '~> 0.4.0'	
end
