# frozen_string_literal: true

require 'active_model'

module Statistics
  # represents visit statistics for one page
  class Entry
    include ActiveModel::Validations

    def initialize(page, views_count, uniq_views_count)
      @page = page
      @views_count = views_count
      @uniq_views_count = uniq_views_count
    end
    attr_reader :page, :views_count, :uniq_views_count

    validates :page, :views_count, :uniq_views_count, presence: true
  end
end
