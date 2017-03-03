class School < ApplicationRecord
  has_many :reviews

  geocoded_by :address
  after_validation :geocode
end
