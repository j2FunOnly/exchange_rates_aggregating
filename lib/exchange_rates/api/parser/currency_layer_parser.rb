require_relative 'json_parser'

module ExchangeRates
  module API
    module Parser
      module CurrencyLayerParser
        extend JSONParser

        def self.parse(response)
          doc = super
          rates = doc.fetch('quotes').transform_keys { |k| k[3..-1] }
          success = doc.fetch('success')
          error = doc.fetch('error') unless success

          {
            base: doc.fetch('source'),
            rates: rates,
            success: success,
            error: success || { message: "#{error['code']}: #{error['message']}" }
          }
        end
      end
    end
  end
end
