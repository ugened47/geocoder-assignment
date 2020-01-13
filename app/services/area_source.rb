# frozen_string_literal: true

class AreaSource
  def self.source
    file = File.read(File.join(Rails.root, 'app', 'services', 'areas.json'))
    JSON.parse(file)
  end
end
