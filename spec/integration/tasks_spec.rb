# frozen_string_literal: true

require 'spec_helper'
require 'rake'
load 'Rakefile'

RSpec.describe 'show_statistics' do
  let(:path) { 'spec/fixtures/example2.log' }
  let(:expected_output) do
    <<~STR
      /home 11 visits
      /about 11 visits
      /contact 9 visits
      /help_page/1 8 visits
      /about/2 7 visits
      /index 5 visits

      /home 9 unique views
      /about 9 unique views
      /contact 7 unique views
      /help_page/1 6 unique views
      /about/2 6 unique views
      /index 5 unique views
    STR
  end

  it 'prints statistics result into stdout' do
    expect { Rake.application.invoke_task "show_statistics[#{path}]" }.to output(expected_output).to_stdout
  end
end
