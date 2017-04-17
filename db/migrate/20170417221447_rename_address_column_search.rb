class RenameAddressColumnSearch < ActiveRecord::Migration[5.0]
  def change
    rename_column :searches, :address, :state
  end
end
