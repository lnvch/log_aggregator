# frozen_string_literal: true

# error raised when file does not exist
class MissingFileError < StandardError
  def initialize
    super('File does not exist')
  end
end
