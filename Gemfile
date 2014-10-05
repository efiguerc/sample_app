source 'https://rubygems.org'

ruby '2.1.3'
# ruby gemset 2.4.2


gem 'rails', '4.1.6'

group :development, :test do
	gem 'sqlite3', '1.3.9'
	gem 'rspec-rails', '3.1.0'
	gem 'guard-rspec'
	gem 'spring', '1.1.3'
end

group :test do
	gem 'selenium-webdriver', '2.43.0'
	gem 'capybara', '2.4.3'
	gem 'libnotify'
end

gem 'sass-rails', '4.0.3'
gem 'uglifier', '2.5.3'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '3.1.2'
gem 'turbolinks', '2.4.0'
gem 'jbuilder', '2.1.3'

gem 'sdoc', '0.4.1', require: false,   group: :doc

group :production do
	gem 'pg'
	gem 'rails_12factor'
	gem 'unicorn'
end