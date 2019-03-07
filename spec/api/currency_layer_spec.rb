RSpec.describe ExchangeRates::API::CurrencyLayer, :vcr do
  let(:key) { ENV.fetch('CURRENCY_LAYER_API_KEY') }

  it_behaves_like 'rates_api_client'
end
