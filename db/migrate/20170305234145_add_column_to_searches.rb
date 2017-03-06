class AddColumnToSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :text, :string
    add_column :searches, :name, :string
  end
end
