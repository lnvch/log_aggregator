# frozen_string_literal: true

module Statistics
  # represents result of statistics calculation
  class Result
    def initialize(page_views)
      @page_views = page_views
    end
    attr_reader :page_views

    def ordered_views
      page_views.sort_by(&:views_count).reverse!
    end

    def ordered_uniq_views
      page_views.sort_by(&:uniq_views_count).reverse!
    end
  end
end
