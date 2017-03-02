class CreateSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :schools do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :text
      t.text :description
      t.integer :zip

      t.timestamps
    end
  end
end
