# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Statistics::Result do
  subject { described_class.new(page_views) }

  let(:entry_1) { Statistics::Entry.new('/contacts', 7, 3) }
  let(:entry_2) { Statistics::Entry.new('/about', 10, 7) }
  let(:entry_3) { Statistics::Entry.new('/index', 4, 4) }

  let(:page_views) { [entry_1, entry_2, entry_3] }

  let(:expected_views_order) { [entry_2, entry_1, entry_3] }
  let(:expected_uniq_views_order) { [entry_2, entry_3, entry_1] }

  it 'stores result of statistics calculation' do
    expect(subject.page_views).to eq(page_views)
  end

  it 'provides ordered page views' do
    expect(subject.ordered_views).to eql(expected_views_order)
  end

  it 'provides ordered unique page views' do
    expect(subject.ordered_uniq_views).to eql(expected_uniq_views_order)
  end
end
