require 'net/http'

require_relative 'parser/null_parser'

module ExchangeRates
  module API
    class Base
      BASE_URL = 'http://example.com'

      def initialize(key)
        @key = key
        yield configure if block_given?
      end

      def configure
        yield config
      end

      def success?
        data.fetch(:success)
      end

      def error?
        !success?
      end

      def error
        return if success?

        error = data.fetch(:error)

        {
          message: error[:message]
        }
      end

      def rate_for(currency)
        return "N/A: error occured - #{error[:message]}" if error?

        target = target_rate(currency)

        if correct_base_rate?
          target
        else
          target / base_rate
        end
      end

      def to_s
        URI.parse(url).host
      end

      protected

      def url
        BASE_URL
      end

      def config
        @config ||= {
          base: 'USD',
          parser: Parser::NullParser
        }
      end

      def data
        @data ||= get_data
      end

      def get_data
        response = Net::HTTP.get URI.parse(url)
        parser = config.fetch(:parser)
        parser.parse response
      end

      def rates
        data.fetch(:rates)
      end

      def base_rate
        rates.fetch(config[:base])
      end

      def correct_base_rate?
        config[:base] == data.fetch(:base)
      end

      def target_rate(currency)
        rates.fetch(currency)
      end
    end
  end
end
