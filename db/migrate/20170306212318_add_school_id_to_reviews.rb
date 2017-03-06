class AddSchoolIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :school_id, :integer
  end
end
