require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TradingStrategyResultAnalytics
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

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.logger = LogStashLogger.new(type: :udp, host: 'logstash', port: 12201, buffer_max_items: 5000)
    Mongoid.logger.level = Logger::FATAL
    Mongo::Logger.logger.level = Logger::FATAL

    config.autoload_paths << "#{Rails.root}/app/domain/builder"
    config.autoload_paths << "#{Rails.root}/app/domain/strategies"
    config.autoload_paths << "#{Rails.root}/app/domain/strategies/random"
    config.autoload_paths << "#{Rails.root}/app/domain/strategies/random/builder"
    config.autoload_paths << "#{Rails.root}/app/domain/strategies/aaa"
    config.autoload_paths << "#{Rails.root}/app/domain/strategies/aaa/builder"
    config.autoload_paths << "#{Rails.root}/app/domain/strategies/aab"
    config.autoload_paths << "#{Rails.root}/app/domain/strategies/aab/builder"
    config.autoload_paths << "#{Rails.root}/app/domain/strategies/aac"
    config.autoload_paths << "#{Rails.root}/app/domain/strategies/aac/builder"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/exchange"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/exchange/builder"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/moving_average"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/moving_average/builder"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/exponential_moving_average"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/exponential_moving_average/builder"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/lowest_value"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/lowest_value/builder"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/highest_value"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/highest_value/builder"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/efficiency_ratio"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/efficiency_ratio/builder"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/psar"
    config.autoload_paths << "#{Rails.root}/app/domain/indicators/psar/builder"
    config.autoload_paths << "#{Rails.root}/app/mappers/builder"
    config.autoload_paths << "#{Rails.root}/app/models/trade"
    config.autoload_paths << "#{Rails.root}/app/models/strategy"
    config.autoload_paths << "#{Rails.root}/app/models/strategy_statistic"
    config.autoload_paths << "#{Rails.root}/app/models/exchange_status"
    config.autoload_paths << "#{Rails.root}/app/models/chart"
    config.autoload_paths << "#{Rails.root}/app/models/indicators"
    config.autoload_paths << "#{Rails.root}/app/models/indicator_lists"
  end
end
