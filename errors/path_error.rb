# frozen_string_literal: true

# error raised when path is not provided
class PathError < StandardError
  def initialize
    super('Provided path is empty')
  end
end
