class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :grade_level
      t.string :subject
      t.string :school_id
    end
  end
end
