# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GeocodeService do
  subject(:service) { GeocodeService }

  let(:inside_location) { '{ "type": "Point", "coordinates": [-85.6329345703125, 35.40696093270201] }' }
  let(:outside_location) { '{ "type": "Point", "coordinates": [-60.6329345703125, 35.40696093270201] }' }

  it 'is inside polygon' do
    expect(service.call(point: inside_location)).to be true
  end

  it 'is outside polygon' do
    expect(service.call(point: outside_location)).to be false
  end
end
