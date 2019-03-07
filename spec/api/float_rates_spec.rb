RSpec.describe ExchangeRates::API::FloatRates, :vcr do
  let(:key) { nil }
  it_behaves_like 'rates_api_client'
end
