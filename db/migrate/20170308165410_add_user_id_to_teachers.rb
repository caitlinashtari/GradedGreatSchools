class AddUserIdToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :user_id, :integer
  end
end
