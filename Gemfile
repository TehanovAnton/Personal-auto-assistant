# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

gem 'bootstrap'
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'elasticsearch-model', github: 'elastic/elasticsearch-rails', branch: 'main'
gem 'elasticsearch-rails', github: 'elastic/elasticsearch-rails', branch: 'main'
gem 'graphql'
gem 'image_processing', '~> 1.2'
gem 'jquery-rails'
gem 'kaminari'
gem 'omniauth-google-oauth2', '~> 1.0'
gem 'omniauth-rails_csrf_protection', '~> 1.0'
gem 'pexels', '~> 0.4.0'
gem 'pundit', '~> 2.1', '>= 2.1.1'
gem 'sidekiq', '~> 6.3', '>= 6.3.1'
gem 'sidekiq-cron'
gem 'simple_form', '~> 5.1'

gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.19'
  gem 'figaro', '~> 1.2'
  gem 'graphiql-rails', github: 'rmosolgo/graphiql-rails'
  gem 'pry', '~> 0.14.1'
  gem 'pry-nav'
  gem 'pry-remote'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'rubocop-rails', require: false
  gem 'shoulda-matchers', '~> 5.1'
  gem 'simplecov', '~> 0.21.2'
end

group :test do
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
end

group :development do
  gem 'annotate', '~> 3.2'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'web-console', '>= 4.1.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'rubocop', '= 1.22.1'
