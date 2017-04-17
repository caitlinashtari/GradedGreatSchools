class Search < ApplicationRecord
  geocoded_by :zip
  after_validation :geocode
  after_validation :reverse_geocode
  validates_presence_of :zip

  reverse_geocoded_by :latitude, :longitude do |obj,results|
  if geo = results.first
    obj.state = geo.state
  end
end

end
