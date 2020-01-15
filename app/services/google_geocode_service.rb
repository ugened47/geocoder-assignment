require 'net/http'

class GoogleGeocodeService
  def self.call(name:)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{name}&key=#{Rails.application.credentials[:google_api_key]}"
    response = Net::HTTP.get_response(URI(url))

    return nil if response.code != '200'

    res_json = JSON.parse(response&.body || '{}').dig('results')&.first
    lat = res_json['geometry']['location']['lat']
    lon = res_json['geometry']['location']['lng']
    { name: res_json['formatted_address'], coordinates: Point.new([lon, lat]).to_json }
  rescue StandardError
    nil
  end
end
