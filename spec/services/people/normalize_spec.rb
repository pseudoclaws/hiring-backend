# frozen_string_literal: true

require 'spec_helper'

RSpec.describe People::Normalize do
  let(:service) { described_class.new(merge_lists: merge_lists, parse: parse) }

  let(:merge_lists) { spy(call: records) }
  let(:parse) { spy call: true }

  let(:records) do
    [
      {
        'birthdate' => Date.new(1947, 05, 04),
        'city' => 'New York City',
        'first_name' => 'Elliot',
        'last_name' => 'Nolan'
      }
    ]
  end

  subject { service.call(dollar_format: double, percent_format: double, order: :first_name) }

  it 'normalizes data' do
    expect(subject).to eq [
      {
        'birthdate' => Date.new(1947, 05, 04),
        'city' => 'New York City',
        'first_name' => 'Elliot'
      }
    ]
  end
end
