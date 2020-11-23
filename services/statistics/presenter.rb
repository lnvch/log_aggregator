# frozen_string_literal: true

module Statistics
  # represents statistics result in defined order
  class Presenter
    def self.call(result)
      new(result).call
    end

    def initialize(result)
      @ordered_views = result.ordered_views
      @ordered_uniq_views = result.ordered_uniq_views
    end
    attr_reader :ordered_views, :ordered_uniq_views

    def call
      print_ordered_views
      puts
      print_ordered_uniq_views
    end

    private

    def print_ordered_views
      ordered_views.each do |entry|
        puts "#{entry.page} #{entry.views_count} visits"
      end
    end

    def print_ordered_uniq_views
      ordered_uniq_views.each do |entry|
        puts "#{entry.page} #{entry.uniq_views_count} unique views"
      end
    end
  end
end
