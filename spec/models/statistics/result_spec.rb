# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../models/statistics/result'

RSpec.describe Statistics::Result do
  subject { described_class.new(first_param, second_param) }

  let(:first_param) { [['/contacts', 10], ['/about', 7]] }
  let(:second_param) { [['/index', 5], ['/about', 4]] }

  it 'stores result of statistics calculation' do
    expect(subject.page_views).to eq(first_param)
    expect(subject.unique_page_views).to eq(second_param)
  end
end
