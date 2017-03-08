class Review < ApplicationRecord
  belongs_to :user
  belongs_to :school
  belongs_to :teacher
end
