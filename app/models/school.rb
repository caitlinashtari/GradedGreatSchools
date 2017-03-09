class School < ApplicationRecord
  has_many :reviews
  has_many :teachers
end
