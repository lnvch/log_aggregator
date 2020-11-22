# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../models/log/entry'

RSpec.describe Log::Entry do
  subject { described_class }

  it 'validates presence of attributes' do
    expect(subject.new(nil, nil)).to be_invalid
  end

  context 'when attributes are present' do
    context 'and ip address does not match pattern' do
      it 'is not valid' do
        expect(subject.new('/contact', 'randomwords')).to be_invalid
      end
    end

    context 'and ip address matches pattern' do
      it 'is valid' do
        expect(subject.new('/contact', '192.168.1.1')).to be_valid
      end
    end
  end
end
