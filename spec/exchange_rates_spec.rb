require 'exchange_rates'

RSpec.describe ExchangeRates do
  it 'has a version' do
    expect(described_class::VERSION).not_to be_nil
  end
end
