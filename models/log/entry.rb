# frozen_string_literal: true

require 'active_model'
require 'resolv'

module Log
  # represents log entry
  class Entry
    include ActiveModel::Validations

    def initialize(page, ip_address)
      @page = page
      @ip_address = ip_address
    end
    attr_reader :page, :ip_address

    validates :page, :ip_address, presence: true
    validates :ip_address, format: {
      with: /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/
    }
  end
end
