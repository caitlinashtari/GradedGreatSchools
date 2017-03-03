class DropJoinTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :schools_users
  end
end
