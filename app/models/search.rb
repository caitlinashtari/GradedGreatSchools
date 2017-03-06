class Search < ApplicationRecord
  geocoded_by :zip
  after_validation :geocode
  
end
