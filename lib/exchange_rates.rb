require 'dotenv/load'

require_relative 'exchange_rates/api/currency_layer'
require_relative 'exchange_rates/api/open_exchange_rates'
require_relative 'exchange_rates/api/float_rates'
require_relative 'exchange_rates/formatter/html'

module ExchangeRates
  VERSION = '0.0.1'.freeze

  def self.sources
    [
      API::CurrencyLayer.new(ENV.fetch('CURRENCY_LAYER_API_KEY')),
      API::OpenExchangeRates.new(ENV.fetch('OPEN_EXCHANGE_RATES_API_KEY')),
      API::FloatRates.new
    ]
  end
end
