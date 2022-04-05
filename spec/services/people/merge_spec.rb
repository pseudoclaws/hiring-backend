# frozen_string_literal: true

require 'spec_helper'

RSpec.describe People::Merge do
  describe 'dollar and percent formats sorted by first_name' do
    let(:service) { described_class.new }
    let(:records) { [{ 'first_name' => 'Mckayla' }, { 'first_name' => 'Elliot' }] }

    subject { service.call('first_name', records) }

    it 'sorts data records by first_name' do
      expect(subject).to eq [{ 'first_name' => 'Elliot' }, { 'first_name' => 'Mckayla' }]
    end
  end
end
