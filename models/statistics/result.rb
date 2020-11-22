# frozen_string_literal: true

module Statistics
  # represents result of statistics calculation
  class Result
    def initialize(page_views, unique_page_views)
      @page_views = page_views
      @unique_page_views = unique_page_views
    end
    attr_reader :page_views, :unique_page_views

    def ordered_views
      page_views.sort { |first, second| second[1] <=> first[1] }
    end

    def ordered_uniq_views
      unique_page_views.sort { |first, second| second[1] <=> first[1] }
    end
  end
end
