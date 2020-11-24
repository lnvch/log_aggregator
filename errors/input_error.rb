# frozen_string_literal: true

# error raised when no input data provided
class InputError < StandardError
  def initialize
    super('No data provided')
  end
end
