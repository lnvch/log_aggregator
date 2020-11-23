# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Statistics::Builder do
  subject { described_class.new(log_entries) }

  let(:log_entries) do
    [
      Log::Entry.new('/contact', '126.318.035.038'),
      Log::Entry.new('/contact', '126.318.035.038')
    ]
  end

  let(:expected_attributes) do
    {
      page: '/contact',
      views_count: 2,
      uniq_views_count: 1
    }
  end

  it 'returns statistic result' do
    result = subject.call

    expect(result).to be_kind_of(Statistics::Result)
    expect(result.page_views.length).to eq(1)
    expect(result.page_views.first).to have_attributes(expected_attributes)
  end

  context 'when file is empty' do
    let(:log_entries) { [] }

    it 'raises error' do
      expect { subject.call }.to raise_error('No data provided')
    end
  end
end
