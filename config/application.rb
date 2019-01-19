require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RootsApp
  class Application < Rails::Application

  config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**' '*.{rb,yml}').to_s]


    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end

    
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Where the I18n library should search for translation files

    
    # Whitelist locales available for the application
    config.i18n.available_locales = [:en, :es]

    # Set default locale to something other than :en
    config.i18n.default_locale = :es


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
