require_relative 'base'
require_relative 'parser/float_rates_parser'

module ExchangeRates
  module API
    class FloatRates < Base
      BASE_URL = 'http://www.floatrates.com/daily/usd.xml'

      def initialize(key = nil)
        super

        configure { |c| c[:parser] = Parser::FloatRatesParser }
      end

      private

      def url
        "#{BASE_URL}"
      end
    end
  end
end
