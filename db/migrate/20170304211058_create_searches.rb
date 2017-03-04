class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.integer :zip

      t.timestamps
    end


  end
end
