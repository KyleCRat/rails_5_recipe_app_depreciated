# Ruby on Rails quick start template

#### Rails 5.2.1 | Ruby 2.5.3

------------

## Installation

#### Database.yml needs some inital info for the database:
- Rename the `config/application.yml.example` to `config/application.yml`
- Populate the `config/application.yml` with the ENV keys required to set up the database.
  - `DEV_DATABASE_NAME`
  - `TEST_DATABASE_NAME`
  - `PRODUCTION_DATABASE_NAME`

When releasing be sure to include `PRODUCTION_DATABASE_NAME` in the configuration variables on your server.

#### Normal Rails setup from here:
- `bundle install`
- `rails db:create db:migrate`
- `rails start`

------------


## Google analytics

Google analytics ID(s) can be placed in `assets/javascripts/vendor/google_analytics.coffee`

------------


## Javascript and JQuery

This template makes full use of turbolinks 5. In a `Production` environment the `application.js` is loaded via the `defer` keyword to prevent the javascript from stalling the load times. These environment names can be changed in the `application.html.erb` layout file.

### initalize function

In the `application.js` file there is a `initialize` function that is fired once on initial page load, and again after every page change. There is a block that checks for the initial loading of the site and anything you wish to only run once per site visit can be placed within.

### Site global variable

Functions are defined to `Site` which is bound to the `window` and can then be called from anywhere. This is most useful to be able to organize your functions into files that are easily findable and only have one purpose.

`Site.exampleFunction = function()`

### Fire function on every page

Place `Site.exampleFunction()` into the `initialzie` function within `application.js`

### Fire function on only certain url, or all sub urls

Place `Site.exampleFunction()` into the `page_specific.js`. There are two switch functions, once will fire on a single page and the other will fire on a page and any url that includes that page.

### js:initialized event

The `initialize` function will fire a `js:initialized` event every time it is fired, you can watch for this event to fire js rather than putting the function call in the `initalize` function.

------------

## Included Non Standard Gems

### [Annotate](https://github.com/ctran/annotate_models "Annotate")
run `annotate` to quickly add helpful annotations to models, and specs

### [Decent Exposure](https://github.com/hashrocket/decent_exposure "Decent Exposure")
A gem that helps keep controllers concise and easy to read.

### [Enumerations](https://github.com/infinum/enumerations)
Better enumerations for rails

### [Interactor](https://github.com/collectiveidea/interactor)
Interactor provides a common interface for performing complex user interactions.

### [Modernizer](https://github.com/russfrisch/modernizr-rails "Modernizer")
Modernizer for easy access to what web technologies are available to the browser

### [Greensock](https://github.com/robertpataki/greensock-rails "Greensock")
Greensock for awesomely powerful animations

### [Devise](https://github.com/plataformatec/devise "Devise")
For user authentication

### [Pundit](https://github.com/varvet/pundit "Pundit")
For permission and authorization

### [Postgres](https://github.com/ged/ruby-pg "Postgres")
This template uses Postgres everywhere by default, to keep your production and development environments as close as possible. Check out the gem page for info on how to set up Postgres if you're having trouble. Check out the Postgres.app for OSX if you want a super easy Postgres setup!

### [Fog AWS](https://github.com/fog/fog-aws "Fog AWS")
The fog_aws gem is for connecting and storing files via Amazon S3, a very affordable and powerful storage option.

### [Remotipart](https://github.com/JangoSteve/remotipart "Remotipart")
A gem that adds AJAX file upload capabilities to Rails

### [Nested Form Fields](https://github.com/ncri/nested_form_fields "Nested Form Fields")
A gem that dynamically adds and removes nested has_many associations fields

### [Simple Form](https://github.com/plataformatec/simple_form "Simple Form")
A gem that makes rails forms well... Simple. Very powerful tool that is setup to make use of foundation framework for quick and easy beautiful functional forms.

### [Client Side Validations](https://github.com/DavyJonesLocker/client_side_validations "Client Side Validations")
A gem that dynamically adds client side validations to Rails Forms based on your model validations.

### [Browser](https://github.com/fnando/browser "Browser")
Get browser information in your server from the agent string of the requests. This allows you to check within views and controllers for things like mobile devices and remove heavy content such as videos in such a case.

### [Airbrake](https://github.com/airbrake/airbrake "Airbrake")
For monitoring errors within your application

### [Newrelic](https://github.com/newrelic/rpm "Newrelic")
For monitoring application performance

### [CSS Splitter](https://github.com/zweilove/css_splitterhttp:// "CSS Splitter")
Gem for splitting up stylesheets that go beyond the IE limit of 4095 selectors, for Rails 3.1+ apps using the Asset Pipeline.

### [Byebug](https://github.com/deivid-rodriguez/byebug "Byebug")
For real time in line code testing

### [Figaro](https://github.com/laserlemon/figaro "Figaro")
A gem that adds environment variables to your development environment.

### [Letter Opener](https://github.com/ryanb/letter_opener "Letter Opener")
Change your development environment to open mailers in a browser window rather than sending

### [Factory Bot Rails](https://github.com/thoughtbot/factory_bot "Factory Bot")
A library for setting up ruby objects for test data

### [Faker](https://github.com/stympy/faker "Faker")
A library for generating fake data, great to use with Factory Bot

### [Rspec](https://github.com/rspec/rspec-rails "Rspec")
A testing library that is much more readable than the default rails testing

### [Guard Livereload](https://github.com/guard/guard-livereload "Guard Livereload")
By running `bundle exec guard` you can have your development browser auto reload on changes within your application

### [Guard RSpec](https://github.com/guard/guard-rspec)
Live checking of rspec tests
