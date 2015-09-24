class AddWantToCreateMultipleAccountsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :want_to_create_multiple_accounts, :boolean
  end
end
