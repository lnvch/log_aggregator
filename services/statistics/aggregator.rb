# frozen_string_literal: true

module Statistics
  # provides statistics for given log file
  class Aggregator
    def self.call(filename, parser = Log::Parser)
      new(filename, parser).call
    end

    def initialize(filename, parser)
      @filename = filename
      @parser = parser
    end
    attr_reader :filename, :parser

    def call
      log_entries = parser.call(filename)
      result = Statistics::Builder.call(log_entries)
      Statistics::Presenter.call(result)
    end
  end
end
