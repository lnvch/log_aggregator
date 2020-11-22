# frozen_string_literal: true

module Statistics
  # builds statistics from log entries
  class Builder
    def self.call(entries)
      new(entries).call
    end

    def initialize(entries)
      @entries = entries
      @extended_statistics = nil
    end
    attr_reader :entries, :extended_statistics

    def call
      raise 'No data provided' if entries.empty?

      build_extended_statistics

      Statistics::Result.new(page_views, unique_page_views)
    end

    private

    def build_extended_statistics
      initial = Hash.new([])
      @extended_statistics = entries.each_with_object(initial) do |entry, res|
        res[entry.page] += [entry.ip_address]
      end
    end

    def page_views
      extended_statistics.to_a.map { |key, value| [key, value.count] }
    end

    def unique_page_views
      extended_statistics.to_a.map { |key, value| [key, value.uniq.count] }
    end
  end
end
