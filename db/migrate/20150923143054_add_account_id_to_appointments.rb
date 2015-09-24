class AddAccountIdToAppointments < ActiveRecord::Migration
  def change
  	add_column :appointments, :account_id, :integer
  end
end
