require 'nokogiri'

module ExchangeRates
  module API
    module Parser
      module XMLParser
        def parse(response)
          Nokogiri::XML(response)
        end
      end
    end
  end
end
