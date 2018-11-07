# frozen_string_literal: true

require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SiteTemplate
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Look for font's folder within the assets dirctory
    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    # Have the rails app use our routes for errors
    config.exceptions_app = self.routes

    # Set the active job queue adaptor to use the sidekiq gem
    config.active_job.queue_adapter = :sidekiq

    # Add precompile to split stylesheet for IE9
    config.assets.precompile += %w( application_split2.css )
  end
end
