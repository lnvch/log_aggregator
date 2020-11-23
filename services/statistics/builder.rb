# frozen_string_literal: true

module Statistics
  # builds statistics from log entries
  class Builder
    def self.call(entries)
      new(entries).call
    end

    def initialize(entries)
      @entries = entries
    end

    def call
      raise 'No data provided' if entries.empty?

      build_extended_statistics

      Statistics::Result.new(page_views)
    end

    private

    attr_reader :entries, :extended_statistics

    def build_extended_statistics
      initial = Hash.new([])
      @extended_statistics = entries.each_with_object(initial) do |entry, res|
        res[entry.page] += [entry.ip_address]
      end
    end

    # :reek:FeatureEnvy
    def page_views
      extended_statistics.to_a.map { |key, value| Statistics::Entry.new(key, value.count, value.uniq.count) }
    end
  end
end
