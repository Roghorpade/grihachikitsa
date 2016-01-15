class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :appointment_id
      t.integer :doctor_id
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
