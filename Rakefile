require_relative 'lib/exchange_rates'

namespace :rates do
  task :prepare, [:base_rate] do |t, args|
    args.with_defaults(base_rate: 'USD')
    base_rate = args.base_rate.upcase[0..3]
    sources = ExchangeRates.sources
    sources.each { |s| s.configure { |c| c[:base] = base_rate } }
    @headers = ['Symbol'] + sources.map(&:to_s)
    targets = args.extras.map { |target| target.upcase[0..3] }

    @data = targets.map do |target|
      [target] + sources.map { |s| s.rate_for target }
    end
  end

  desc 'Aggregate exchange rates and save data to html file'
  task :html, [:base_rate] => :prepare do |t, args|
    doc = ExchangeRates::Formatter::HTML.format(@data, @headers)
    filename = Time.now.strftime('output/%Y%m%d_%H%M%S.html')
    Dir.mkdir('output') unless Dir.exist?('output')
    File.open(filename, 'w') { |f| f.write doc }
  end
end
