# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StoreApp
  class Application < Rails::Application

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.initialize_on_precompile = false

    config.generators do |g|
      g.template_engine :slim
      g.helper false
      g.assets false
      g.routing_specs false
      g.view_specs false
      g.controller_specs false
      g.request_specs false
      g.stylesheets false
      g.javascripts false
    end

  end
end
