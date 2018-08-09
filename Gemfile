source 'https://rubygems.org'
gem 'rails', '~> 5.1.1'
gem 'dotenv-rails', :groups => [:development, :test]

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'acts-as-taggable-on'
gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.2'
gem 'enum_help'
gem 'faker'
gem 'fog'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails' 
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'
gem 'kaminari'
gem 'mini_magick'
gem 'omniauth-google-oauth2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'selenium-webdriver'
  gem 'spring'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'capybara'
  gem 'database_cleaner'
  gem "launchy"
  gem "selenium-webdriver"
end

