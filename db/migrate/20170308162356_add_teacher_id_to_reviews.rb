class AddTeacherIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :teacher_id, :integer
  end
end
