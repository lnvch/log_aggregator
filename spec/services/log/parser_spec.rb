# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Log::Parser do
  subject { described_class.new(path) }

  context 'when path is proper' do
    let(:path) { 'spec/fixtures/example.log' }

    it 'returns array of log entries' do
      result = subject.call

      expect(result).to be_kind_of(Array)
      expect(result.length).to eq(1)
      expect(result.first.page).to eq('/contact')
      expect(result.first.ip_address).to eq('192.168.1.1')
    end
  end

  context 'when path is nil' do
    let(:path) { nil }

    it 'raises error' do
      expect { subject.call }.to raise_error('Provided path is empty')
    end
  end

  context 'when path has wrong file format' do
    let(:path) { 'spec/fixtures/example.txt' }

    it 'raises error' do
      expect { subject.call }.to raise_error('File format is wrong')
    end
  end

  context 'when file does not exist' do
    let(:path) { 'spec/fixtures/example1.log' }

    it 'raises error' do
      expect { subject.call }.to raise_error('File does not exist')
    end
  end

  context 'when line in the file is malformed' do
    let(:path) { 'spec/fixtures/malformed.log' }

    it 'raises error' do
      expect { subject.call }.to raise_error('Input file is malformed')
    end
  end
end
