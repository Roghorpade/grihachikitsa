class AddAddressToToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :address, :string
  end

  def down
  	remove_column :users, :adress, :string
  end
end
