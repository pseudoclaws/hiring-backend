# frozen_string_literal: true

require 'spec_helper'

RSpec.describe People::Serialize do
  let(:service) { described_class.new }

  let(:people_records) do
    [
      {
        'first_name' => 'Rhiannon',
        'city' => 'Los Angeles',
        'birthdate' => Date.new(1974, 4, 30)
      },
      {
        'first_name' => 'Rigoberto',
        'city' => 'New York City',
        'birthdate' => Date.new(1962, 1, 5)
      }
    ]
  end

  subject { service.call(people_records) }

  it 'serializes data records' do
    expect(subject).to eq [
      'Rhiannon, Los Angeles, 4/30/1974',
      'Rigoberto, New York City, 1/5/1962'
    ]
  end
end
