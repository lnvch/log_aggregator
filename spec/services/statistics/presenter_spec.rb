# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Statistics::Presenter do
  subject { described_class.new(input) }

  let(:input) do
    Statistics::Result.new(
      [['/contact', 5], ['/about', 7], ['/help_page/1', 3]],
      [['/contact', 2], ['/about', 1], ['/help_page/1', 3]]
    )
  end
  let(:expected_output) do
    <<~STR
      /about 7 visits
      /contact 5 visits
      /help_page/1 3 visits

      /help_page/1 3 unique views
      /contact 2 unique views
      /about 1 unique views
    STR
  end

  it 'represents statistics result in defined order' do
    expect { subject.call }.to output(expected_output).to_stdout
  end
end
