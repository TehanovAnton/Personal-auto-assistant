# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
gem 'bootstrap'
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'elasticsearch-model', github: 'elastic/elasticsearch-rails', branch: 'main'
gem 'elasticsearch-rails', github: 'elastic/elasticsearch-rails', branch: 'main'
gem 'graphql'
gem 'jquery-rails'
gem 'kaminari'
gem 'omniauth-google-oauth2', '~> 1.0'
gem 'omniauth-rails_csrf_protection', '~> 1.0'
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
  gem 'pry', '~> 0.14.1'
  gem 'pry-nav'
  gem 'pry-remote'
end

group :development do
  gem 'annotate', '~> 3.2'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop-rails', require: false
  gem 'web-console', '>= 4.1.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'graphiql-rails', github: 'rmosolgo/graphiql-rails', group: :development
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
