# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Statistics::Entry do
  subject { described_class.new(page, count, uniq_count) }

  let(:page) { '/contacts' }
  let(:count) { 5 }
  let(:uniq_count) { 3 }

  describe '#page' do
    it 'stores first param' do
      expect(subject.page).to eq(page)
    end
  end

  describe '#count' do
    it 'stores second param' do
      expect(subject.views_count).to eq(count)
    end
  end

  describe '#uniq_count' do
    it 'stores third param' do
      expect(subject.uniq_views_count).to eq(uniq_count)
    end
  end

  context 'when page param is missing' do
    let(:page) { nil }

    it { is_expected.to be_invalid }
  end

  context 'when count param is missing' do
    let(:count) { nil }

    it { is_expected.to be_invalid }
  end

  context 'when uniq count param is missing' do
    let(:uniq_count) { nil }

    it { is_expected.to be_invalid }
  end
end
