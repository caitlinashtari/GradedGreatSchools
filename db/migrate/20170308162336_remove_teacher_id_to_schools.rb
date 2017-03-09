class RemoveTeacherIdToSchools < ActiveRecord::Migration[5.0]
  def change
    remove_column :schools, :teacher_id, :integer
  end
end
