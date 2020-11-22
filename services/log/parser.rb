# frozen_string_literal: true

module Log
  # parses file into array of log entries
  class Parser
    def self.call(path)
      new(path).call
    end

    def initialize(path)
      @path = path
      @result = []
    end

    def call
      file = File.open(path, 'r')
      file.each_line do |line|
        result << Log::Entry.new(*line.split)
      end
      result
    end

    private

    attr_accessor :path, :result
  end
end
