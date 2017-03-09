class AddTeacherIdToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :schools, :teacher_id, :integer
  end
end
