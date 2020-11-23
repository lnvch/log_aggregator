# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Statistics::Aggregator do
  subject { described_class.new(path) }

  let(:path) { 'spec/fixtures/example2.log' }
  let(:expected_output) do
    <<~STR
      /about 11 visits
      /home 11 visits
      /contact 9 visits
      /help_page/1 8 visits
      /about/2 7 visits
      /index 5 visits

      /about 9 unique views
      /home 9 unique views
      /contact 7 unique views
      /about/2 6 unique views
      /help_page/1 6 unique views
      /index 5 unique views
    STR
  end

  it 'provides log statistics result' do
    expect { subject.call }.to output(expected_output).to_stdout
  end

  context 'when input file is malformed' do
    let(:path) { 'spec/fixtures/malformed.log' }

    it 'raises error' do
      expect { subject.call }.to raise_error('Input file is malformed')
    end
  end
end
