# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Statistics::Presenter do
  subject { described_class.new(input) }

  let(:input) do
    Statistics::Result.new(
      [
        Statistics::Entry.new('/contact', 5, 2),
        Statistics::Entry.new('/about', 7, 1),
        Statistics::Entry.new('/help_page/1', 3, 3)
      ]
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
