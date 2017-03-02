class Update < ActiveRecord::Migration[5.0]
  def change
    rename_table :users_schools, :schools_users
  end
end
