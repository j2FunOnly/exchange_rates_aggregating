RSpec.describe ExchangeRates::API::OpenExchangeRates, :vcr do
  let(:key) { ENV.fetch('OPEN_EXCHANGE_RATES_API_KEY') }

  it_behaves_like 'rates_api_client'
end
