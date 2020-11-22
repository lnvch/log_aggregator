# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../models/log/entry'

RSpec.describe Log::Entry do
  subject { described_class.new }

  it 'validates presence of attributes' do
    expect(subject).to be_invalid
  end

  context 'when attributes are present' do
    before do
      subject.page = '/contact'
    end

    it 'validates ip address' do
      subject.ip_address = 'randomwords'

      expect(subject).to be_invalid
    end
  end
end
