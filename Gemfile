source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Core
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0'
gem 'redis', '~> 4.0'
gem 'sqlite3', '~> 1.4'

# フロントビルドシステム
gem 'cssbundling-rails'
gem 'jsbundling-rails'
gem 'sass-rails', '>= 6'
gem 'sprockets-rails'

# View / Presenter
gem 'jbuilder', '~> 2.7'
gem 'kaminari'
gem 'stimulus-rails'
gem 'turbo-rails'

# Performance
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
