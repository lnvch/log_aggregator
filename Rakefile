# frozen_string_literal: true

desc 'provides statistics for log entries'
task :show_statistics, [:filename] => :environment do |_t, args|
  Statistics::Aggregator.call(args[:filename])
end

desc 'adds dependencies'
task :environment do
  Dir[
    File.join(__dir__, 'errors', '**', '*.rb'),
    File.join(__dir__, 'models', '**', '*.rb'),
    File.join(__dir__, 'services', '**', '*.rb')
  ].sort.each { |file| require file }
end
