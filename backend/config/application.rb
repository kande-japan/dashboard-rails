require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
# require "action_mailer/railtie"
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
# require "action_cable/engine"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # # CORS
    # config.action_dispatch.default_headers = {
    #   'Access-Control-Allow-Credentials' => 'true',
    #   'Access-Control-Allow-Origin' => 'http://localhost:8080', # アクセス元のURL
    #   'Access-Control-Request-Method' => '*' # 許可するメソッド（GET,POST,DELETEなど）：'*'は全てのメソッドという意味
    # }

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:8080'
        resource '*', headers: :any, methods: %i[get post patch delete head options]
      end
    end
  end
end

module HogeApp
  class Application < Rails::Application
    config.middleware.delete ActionDispatch::HostAuthorization
  end
end