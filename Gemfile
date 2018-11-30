# frozen_string_literal: true

source 'https://rubygems.org'

##########################################
# Application Structure
##########################################

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Use Redis for cache store
gem 'redis-rails'

# Cache large items quickly
gem 'bootsnap', require: false

# calculate and store measurements
gem 'ruby-units'

##########################################
# Documentation
##########################################

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Eaily view db schemas - bundle exec annotate
gem 'annotate', group: :development

##########################################
# Design, structure, and management
##########################################

# Use Sass, SCSS for stylesheets
gem 'sass-rails'

# foundation for rails
gem 'foundation-rails'

# mask inputs to auto format responces
gem 'maskedinput-rails'

# add css prefixes automatically
gem 'autoprefixer-rails'

# add haml support for rails
gem 'haml-rails'

# A library for creating declarative interfaces in controllers
gem 'decent_exposure'

# Better Enumerations
gem 'enumerations'

# Single Service Objects
gem 'interactor'

# Decorators
gem 'draper'

##########################################
# Javascript
##########################################

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'

# Add modernizr
gem 'modernizr-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Include Jquery ui
gem 'jquery-ui-rails'

# slick slider for rails
gem 'jquery-slick-rails'

# Cookies via javascript
gem 'js_cookie_rails'

# GSAP Animation library
gem 'greensock-rails'

# Count up js, allows animated number changes
gem 'countupjs-rails'

##########################################
# Authentication
##########################################

# devise authentication system
gem 'devise'

# pundit authorization system
gem 'pundit'

##########################################
# Uploading and Storage
##########################################

# postgress database gem
gem 'pg'

# Nested attributes forms
gem 'nested_form_fields'

# Simple, efficient background processing for Ruby.
#   Install info: https://github.com/mperham/sidekiq/wiki/Active+Job
gem 'sidekiq'

# Elasticsearch search database
gem 'chewy'

##########################################
# Forms
##########################################

# Simple form - a easier way to make rails forms
gem 'simple_form'
gem 'client_side_validations'
gem 'client_side_validations-simple_form'

# embeded form fields
gem 'cocoon'

# Pagination at the model level
#gem 'kaminari'

##########################################
# Webserver and server info
##########################################

# Server side browser detection and device info
gem 'browser'

# Error and Performance monitoring
gem 'airbrake', '~> 7.1'
gem 'newrelic_rpm'

# Unicorn server in production
gem 'puma'
gem 'puma_worker_killer'

# Start Grouped Enviroments
##########################################
# PRODUCTION AND STAGING

group :production, :staging do

  # helps serve font-face assets in Rails by setting CORS
  gem 'font_assets'

  # Makes running your Rails app easier. Based on the ideas behind http://12factor.net
  gem 'rails_12factor'

  # Split the CSS for ie9 and below
  gem 'css_splitter'
end

# END | PRODUCTION AND STAGING
##########################################
# DEVELOPMENT AND TEST

group :development, :test do
  gem 'byebug'

  # define local variabes in development - config/
  gem 'figaro'

  # Preview email in the default browser instead of sending it via
  gem 'letter_opener'

  # A library for setting up Ruby objects as test data
  gem 'factory_bot_rails'

  # A library for generating fake data
  gem 'faker'

  # Rspec testing library
  gem 'rspec-rails'

  # Guard Live Watching of Rspec
  gem 'guard-rspec'
end

# END | DEVELOPMENT AND TEST
##########################################
# DEVELOPMENT ONLY

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Live reload for auto refresh of development
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'rack-livereload'

  gem 'rubocop', require: false
end

# END | DEVELOPMENT ONLY
##########################################

ruby '2.5.3'
