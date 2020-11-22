# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../services/log/parser'
require_relative '../../../models/log/entry'

RSpec.describe Log::Parser do
  subject { described_class }

  let(:path) { 'spec/fixtures/example.log' }
  let(:path_with_wrong_format) { 'spec/fixtures/example.txt' }
  let(:wrong_path) { 'spec/fixtures/example1.log' }

  it 'returns array of log entries' do
    result = subject.call(path)

    expect(result).to be_kind_of(Array)
    expect(result.length).to eq(1)
    expect(result.first.page).to eq('/contact')
    expect(result.first.ip_address).to eq('192.168.1.1')
  end

  it 'checks that path is not empty' do
    expect { subject.call(nil) }.to raise_error('Provided path is empty')
  end

  it 'checks file format' do
    expect do
      subject.call(path_with_wrong_format)
    end.to raise_error('File format is wrong')
  end

  it 'checks that file exists' do
    expect { subject.call(wrong_path) }.to raise_error('File does not exist')
  end

  context 'when line in the file is malformed' do
    let(:path) { 'spec/fixtures/malformed.log' }

    it 'skips malformed line' do
      result = subject.call(path)

      expect(result.length).to eq(2)
      expect(result[0].page).to eq('/contact')
      expect(result[1].page).to eq('/about')
    end
  end
end
