require_relative 'base'
require_relative 'parser/open_exchange_rates_parser'

module ExchangeRates
  module API
    class OpenExchangeRates < Base
      BASE_URL = 'http://openexchangerates.org/api'

      def initialize(key)
        super

        configure { |c| c[:parser] = Parser::OpenExchangeRatesParser }
      end

      private

      def url
        "#{BASE_URL}/latest.json?app_id=#{@key}"
      end
    end
  end
end
