require 'json'

module ExchangeRates
  module API
    module Parser
      module JSONParser
        def parse(response)
          JSON.parse response
        end
      end
    end
  end
end
