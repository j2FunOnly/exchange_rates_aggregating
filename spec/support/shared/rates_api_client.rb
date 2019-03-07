RSpec.shared_examples 'rates_api_client' do
  subject { described_class.new key }
  let(:current_curency) { 'USD' }

  describe 'fetch rates' do
    before(:each) { subject.configure { |c| c[:base] = current_curency } }

    it { is_expected.to be_success }

    it { is_expected.not_to be_error }

    it 'error is nil' do
      expect(subject.error).to be_nil
    end

    it 'should return currency rate' do
      expect(subject.rate_for(current_curency)).to eq(1)
    end

    describe 'other than USD currency' do
      let(:current_curency) { 'EUR' }

      it 'return calculated rate' do
        expect(subject.rate_for(current_curency)).to eq(1)
      end
    end
  end
end
