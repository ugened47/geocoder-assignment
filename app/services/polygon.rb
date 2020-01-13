# frozen_string_literal: true

class Polygon
  attr_accessor :points

  def initialize(points)
    @points = points
    @points << points[0] if points[0] != points[-1]
  end

  def self.to_proc
    ->(i) { new(i) }
  end

  def contains?(point) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    last_point = @points[-1]
    odd_nodes = false
    x = point.lon
    y = point.lat

    @points.each do |p|
      yi = p.lat
      xi = p.lon
      yj = last_point.lat
      xj = last_point.lon
      if yi < y && yj >= y || yj < y && yi >= y
        odd_nodes = !odd_nodes if xi + (y - yi) / (yj - yi) * (xj - xi) < x
      end

      last_point = p
    end

    odd_nodes
  end
end
