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

      Statistics::Result.new(statistic_entries)
    end

    private

    attr_reader :entries

    def statistic_entries
      grouped_entries_by_page.to_a.map do |page, ip_addresses|
        Statistics::Entry.new(page, ip_addresses.count, ip_addresses.uniq.count)
      end
    end

    def grouped_entries_by_page
      entries.each_with_object(Hash.new([])) do |entry, result|
        result[entry.page] += [entry.ip_address]
      end
    end
  end
end
