# frozen_string_literal: true

module Log
  # parses file into array of log entries
  class Parser
    def self.call(path)
      new(path).call
    end

    def initialize(path)
      @path = path.to_s
      @result = []
    end

    def call
      check_file

      file = File.open(path, 'r')
      file.each_line { |line| parse_line(line) }
      result
    ensure
      file&.close
    end

    private

    attr_accessor :path, :result

    def check_file
      raise PathError if path.empty?
      raise MissingFileError unless File.file?(path)
      raise FileFormatError unless File.extname(path) == '.log'
    end

    def parse_line(line)
      params = line.split
      entry = Log::Entry.new(params[0], params[1])

      raise FileContentError unless entry.valid?

      result << entry
      result
    end
  end
end
