require_relative 'base'
require_relative 'parser/currency_layer_parser'

module ExchangeRates
  module API
    class CurrencyLayer < Base
      BASE_URL = 'http://apilayer.net/api'

      def initialize(key)
        super

        configure { |c| c[:parser] = Parser::CurrencyLayerParser }
      end

      private

      def url
        "#{BASE_URL}/live?access_key=#{@key}"
      end
    end

  end
end
