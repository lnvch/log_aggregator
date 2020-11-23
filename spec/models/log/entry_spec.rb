# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Log::Entry do
  subject { described_class.new(page, ip_address) }

  context 'with empty params' do
    let(:page) { nil }
    let(:ip_address) { nil }

    it { is_expected.to be_invalid }
  end

  context 'when attributes are present' do
    let(:page) { '/contact' }

    context 'and ip address does not match pattern' do
      let(:ip_address) { 'randomwords' }

      it { is_expected.to be_invalid }
    end

    context 'and ip address matches pattern' do
      let(:ip_address) { '192.168.1.1' }

      it { is_expected.to be_valid }
    end
  end
end
