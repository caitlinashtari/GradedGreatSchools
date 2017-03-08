class Review < ApplicationRecord
  belongs_to :user
  belongs_to :teacher, optional: true
  belongs_to :school, optional: true
end
