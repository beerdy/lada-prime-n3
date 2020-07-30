require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LadaPrime
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.i18n.default_locale = :ru
    config.generators.assets   = false
    config.generators.helper   = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'lada-prime.ru','lada-prime.ru:80','lada-prime.ru:443','www.lada-prime.ru','www.lada-prime.ru:80','www.lada-prime.ru:443'
        resource '*', headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head]
      end
    end

    # For 404 page
    require Rails.root.join("lib/custom_public_exceptions")    
    config.exceptions_app = CustomPublicExceptions.new(Rails.public_path)
  end
end
