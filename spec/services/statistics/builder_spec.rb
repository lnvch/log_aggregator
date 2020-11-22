# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../services/statistics/builder'
require_relative '../../../models/log/entry'
require_relative '../../../models/statistics/result'

RSpec.describe Statistics::Builder do
  subject { described_class }

  let(:entries) do
    [
      Log::Entry.new('/contact', '126.318.035.038'),
      Log::Entry.new('/contact', '126.318.035.038'),
      Log::Entry.new('/about', '126.318.035.038'),
      Log::Entry.new('/about', '543.910.244.929'),
      Log::Entry.new('/help_page/1', '543.910.244.929')
    ]
  end

  it 'returns statistic result' do
    result = subject.call(entries)

    expect(result).to be_kind_of(Statistics::Result)
    expect(result.page_views).to eq(
      [['/contact', 2], ['/about', 2], ['/help_page/1', 1]]
    )
    expect(result.unique_page_views).to eq(
      [['/contact', 1], ['/about', 2], ['/help_page/1', 1]]
    )
  end
end
