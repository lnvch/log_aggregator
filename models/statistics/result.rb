# frozen_string_literal: true

module Statistics
  # represents result of statistics calculation
  class Result
    def initialize(page_views, unique_page_views)
      @page_views = page_views
      @unique_page_views = unique_page_views
    end
    attr_reader :page_views, :unique_page_views
  end
end
