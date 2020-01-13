# frozen_string_literal: true

class Point
  attr_accessor :lat, :lon

  def initialize(arr)
    @lon = arr[0]
    @lat = arr[1]
  end

  def self.from_geo_json(point)
    point = JSON.parse(point)
    if point['type'] != 'Point' || point['coordinates'].blank?
      raise 'Not valid GeoJson Point'
    end

    new(point['coordinates'])

  rescue JSON::ParserError
    raise 'Not valid json'
  end

  def self.to_proc
    ->(i) { new(i) }
  end

  def !=(other)
    @lat != other.lat && @lon != other.lon
  end
end
