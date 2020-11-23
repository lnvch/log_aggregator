# frozen_string_literal: true

require 'pry'

Dir[
  File.join(__dir__, '..', 'models', '**', '*.rb'),
  File.join(__dir__, '..', 'services', '**', '*.rb')
].sort.each { |file| require file }
