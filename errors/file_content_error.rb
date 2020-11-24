# frozen_string_literal: true

# error raised when records in file have wrong structure
class FileContentError < StandardError
  def initialize
    super('Input file is malformed')
  end
end
