# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Statistics::Aggregator do
  subject { described_class.new(path) }

  let(:path) { 'spec/fixtures/example2.log' }
  let(:expected_output) do
    <<~STR
      /home 11 visits
      /about 11 visits
      /contact 9 visits
      /help_page/1 8 visits
      /about/2 7 visits
      /index 5 visits

      /home 9 unique views
      /about 9 unique views
      /contact 7 unique views
      /help_page/1 6 unique views
      /about/2 6 unique views
      /index 5 unique views
    STR
  end

  it 'provides log statistics result' do
    expect { subject.call }.to output(expected_output).to_stdout
  end

  context 'when input file is malformed' do
    let(:path) { 'spec/fixtures/malformed.log' }
    let(:expected_output) do
      <<~STR
        /contact 1 visits
        /about 1 visits

        /contact 1 unique views
        /about 1 unique views
      STR
    end

    it 'still provides statistics for valid entries' do
      expect { subject.call }.to output(expected_output).to_stdout
    end
  end
end
