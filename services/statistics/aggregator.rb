# frozen_string_literal: true

module Statistics
  # provides statistics for given log file
  class Aggregator
    def self.call(filename)
      new(filename).call
    end

    def initialize(filename)
      @filename = filename
    end
    attr_reader :filename

    def call
      log_entries = Log::Parser.call(filename)
      result = Statistics::Builder.call(log_entries)
      Statistics::Presenter.call(result)
    end
  end
end
