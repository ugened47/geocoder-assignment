# frozen_string_literal: true

class GeoJsonProcessor
  def initialize(source = AreaSource.source)
    @source = source
  end

  def polygons
    vertices.map(&Polygon)
  end

  private

  def coordinates
    @source['features'].map { |f| f['geometry']['coordinates'].first }
  end

  def vertices
    coordinates.map { |c| c.map(&Point) }
  end
end
