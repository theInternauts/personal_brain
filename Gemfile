source 'https://rubygems.org'
ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.4.5'
gem 'pg'
# gem 'mysql2', '~> 0.3.13'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

gem 'jquery-ui-rails'
gem 'jquery-rails'
gem 'turbolinks'
# gem 'jbuilder'
gem 'json'
gem 'slim'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'rack'
gem 'rack-cors', :require => 'rack/cors'
gem 'unicorn'
gem 'sanitize'
gem 'ember-rails'
gem 'bookmarks'
# gem 'bookmarks', :git => 'https://github.com/theInternauts/bookmarks.git', :branch => 'delicious-support'
gem 'kaminari'
gem 'clearance'
gem 'pundit'
# gem "administrate", "~> 0.2.2"
gem 'friendly_id'
gem 'rails_12factor'

group :development, :test do
	gem "rspec-rails", '~> 2.13.2'
  gem 'fabrication', '2.11.3'
  gem 'json_spec', '~> 1.0.3'
  gem 'irake'
  gem 'ruby-prof'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-nav'
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
