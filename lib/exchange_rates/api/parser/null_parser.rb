module ExchangeRates
  module API
    module Parser
      module NullParser
        def self.parse(response)
          raise NotImplementedError
        end
      end
    end
  end
end
