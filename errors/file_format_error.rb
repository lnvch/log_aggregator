# frozen_string_literal: true

# error raised when file format is not .log
class FileFormatError < StandardError
  def initialize
    super('File format is wrong')
  end
end
