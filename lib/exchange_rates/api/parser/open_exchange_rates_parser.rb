require_relative 'json_parser'

module ExchangeRates
  module API
    module Parser
      module OpenExchangeRatesParser
        extend JSONParser

        def self.parse(response)
          doc = super
          rates = doc.fetch('rates')
          error = doc.fetch('error', false)
          success = !error

          {
            base: doc.fetch('base'),
            rates: rates,
            success: success,
            error: success || { message: "#{doc['status']}: #{doc['message']}" }
          }
        end
      end
    end
  end
end
