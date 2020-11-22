# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../services/statistics/aggregator'
require_relative '../../../services/log/parser'
require_relative '../../../models/log/entry'
require_relative '../../../services/statistics/builder'
require_relative '../../../models/statistics/result'
require_relative '../../../services/statistics/presenter'

RSpec.describe Statistics::Aggregator do
  subject { described_class }

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
    expect { subject.call(path) }.to output(expected_output).to_stdout
  end
end
