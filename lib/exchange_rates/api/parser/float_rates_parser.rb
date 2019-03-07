require_relative 'xml_parser'

module ExchangeRates
  module API
    module Parser
      module FloatRatesParser
        extend XMLParser

        def self.parse(response)
          doc = super

          {
            success: true,
            base: doc.at('/channel/baseCurrency').content,
            rates: get_rates(doc)
          }
        end

        def self.get_rates(doc)
          rates = doc.xpath('/channel/item').map do |item|
            [
              item.at('./targetCurrency').content,
              item.at('./exchangeRate').content.to_f
            ]
          end.to_h

          rates['USD'] = 1
          rates
        end
      end
    end
  end
end
