class CreateAppointmentsDoctors < ActiveRecord::Migration
  def change
    create_table :appointments_doctors do |t|
    	t.integer :doctor_id
    	t.integer :appointment_id
      t.timestamps
    end
  end
end
