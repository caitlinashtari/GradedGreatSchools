class Teacher < ApplicationRecord
  has_many :reviews
  belongs_to :school
end
