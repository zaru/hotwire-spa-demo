source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.1'

# Core
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0'
gem 'redis', '~> 4.0'
gem 'sqlite3', '~> 1.4'

# フロントビルドシステム
gem 'sprockets-rails'
gem 'cssbundling-rails'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'

# View / Presenter
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder', '~> 2.7'
gem 'kaminari'

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
