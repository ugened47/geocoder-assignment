# frozen_string_literal: true

class GeocodeJob < ApplicationJob
  queue_as :default

  def perform(id)
    location = Location.find(id)
    res = GoogleGeocodeService.call(name: location.name)
    return unless res

    res.merge!(inside: GeocodeService.call(point: res[:coordinates]))
    Location.find(id).update(res)
  end
end
