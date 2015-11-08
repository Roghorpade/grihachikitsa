class ConnectResultToAppointments < ActiveRecord::Migration
  def change
  	add_column :results, :appointment_id, :integer
  end
end
