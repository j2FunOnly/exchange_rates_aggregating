require 'vcr'
require 'webmock/rspec'

VCR.configure do |c|
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.cassette_library_dir = 'spec/fixtures/vcr/cassettes'
  c.default_cassette_options = {
    record: :new_episodes,
    re_record_interval: 60 * 60 * 60 * 24 # 24 hours interval in seconds
  }
end
