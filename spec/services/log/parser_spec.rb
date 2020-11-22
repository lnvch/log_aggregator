# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../services/log/parser'
require_relative '../../../models/log/entry'

RSpec.describe Log::Parser do
  subject { described_class }

  let(:path) { 'spec/fixtures/example.log' }

  it 'returns array of log entries' do
    result = subject.call(path)

    expect(result).to be_kind_of(Array)
    expect(result.length).to eq(1)
    expect(result.first.page).to eq('/contact')
    expect(result.first.ip_address).to eq('192.168.1.1')
  end
end
