# frozen_string_literal: true

require 'spec_helper'

RSpec.describe People::Parse do
  let(:service)   { described_class.new }

  let(:data)      { File.read('spec/fixtures/people_by_dollar.txt') }
  let(:separator) { '$' }

  subject { service.call(data, separator) }

  it 'parses input data' do
    expect(subject).to eq [
      {
        'first_name' => 'Rhiannon',
        'last_name' => 'Nolan',
        'city' => 'Los Angeles',
        'birthdate' => Date.new(1974, 4, 30)
      },
      {
        'first_name' => 'Rigoberto',
        'last_name' => 'Bruen',
        'city' => 'New York City',
        'birthdate' => Date.new(1962, 1, 5)
      }
    ]
  end
end
