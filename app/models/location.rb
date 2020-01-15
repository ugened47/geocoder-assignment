class Location < ApplicationRecord
  validates :name, presence: true

  after_create :geocode

  private

  def geocode
    GeocodeJob.perform_later(id)
  end
end
