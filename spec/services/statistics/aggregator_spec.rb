# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../services/statistics/aggregator'

RSpec.describe Statistics::Aggregator do
  subject { described_class }

  let(:filename) { 'dummy' }
  let(:log_entries) { double('log entries') }
  let(:result) { double('result') }

  before do
    allow(Log::Parser).to receive(:call).and_return(log_entries)
    allow(Statistics::Builder).to receive(:call).and_return(result)
  end

  it 'calls parser, builder and presenter' do
    expect(Log::Parser).to receive(:call).with(filename)
    expect(Statistics::Builder).to receive(:call).with(log_entries)
    expect(Statistics::Presenter).to receive(:call).with(result)

    subject.call(filename)
  end
end
