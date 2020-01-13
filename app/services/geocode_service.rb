# frozen_string_literal: true

class GeocodeService
  attr_reader :point

  def initialize(point:)
    @point = point
  end

  def self.call(point:)
    new(point: Point.from_geo_json(point)).inside?
  end

  def inside?
    polygons.map { |p| p.contains?(@point) }.include?(true)
  end

  def to_s
    inside?
  end

  private

  def polygons
    geoprocessor.polygons
  end

  def geoprocessor
    @geoprocessor ||= GeoJsonProcessor.new
  end
end
