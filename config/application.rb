require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Berlinarttours
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    #config.time_zone = 'Central Time (US & Canada)'
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :de
    I18n.enforce_available_locales = true


    #Helper modules
    config.autoload_paths += %W(#{config.root}/lib/helpers/)

    config.assets.paths += Dir["#{Rails.root}/vendor/fonts/*"].sort_by { |dir| -dir.size }
    #config.assets.precompile += ['calendar.js', 'google_analytics.js', 'gmaps-auto-complete.js', 'filter.js', 'history.js', 'raty.js', 'letsrate.js']
    #config.assets.precompile += ['star-half.png', 'star-off.png', 'star-on.png']

    config.action_mailer.default_url_options = {
        :host => ENV['HOST_DOMAIN']
    }

    # Don´t generate RSpec test for views and helpers
    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.ficture_replacement :factory_girl, dir: 'spec/factories'
      g.view_spec false
      g.helper_specs false
      g.stylesheets = false
      g.javascripts = false
      g.helper = false
      g.template_engine :haml
    end

    # prevent logging of passwords
    config.filter_parameters += [:password, :password_confirmation]

    config.assets.initialize_on_precompile = false
    config.serve_static_assets = true

    #exception handling
    config.exceptions_app = self.routes
  end
end
