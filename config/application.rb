require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KelebekVadisi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    Dir[
      Rails.root.join('lib', 'support', '**', '*.rb')
    ].sort.each { |file| require file }

    # time-zone. ActiveSupport::TimeZone.all for all possible values
    config.time_zone = 'Istanbul'

    # we will set default locale to Turkish in the future
    config.i18n.default_locale = :tr

    # support Turkish and English as locales
    I18n.available_locales = %i[tr en]

    # auto-load nested translation folders ie: locales/models/foo.yml
    I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]

    config.assets.enabled = true

    config.assets.paths << Rails.root.join('app', 'assets', 'javascripts')
    config.i18n.load_path += Dir[Rails.root.join('app', 'views', '*', 'locales', '**', '*.yml').to_s]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
