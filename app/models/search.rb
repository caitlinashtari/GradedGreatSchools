class Search < ApplicationRecord
  geocoded_by :zip
  after_validation :geocode

  validates_presence_of :zip

end
