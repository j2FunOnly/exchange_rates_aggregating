require 'erb'

module ExchangeRates
  module Formatter
    module HTML
      def self.format(data, headers = [])
        filename = File.join(File.dirname(__FILE__), 'html.erb')
        template = ERB.new(File.read(filename))
        template.result(binding)
      end
    end
  end
end
