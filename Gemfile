source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.0'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 3.11'
gem 'redis'
gem 'sidekiq'

gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'jbuilder'

#  Admin

gem 'administrate'

# Front-end

gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'byebug'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'rubocop'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
