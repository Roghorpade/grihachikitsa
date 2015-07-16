class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user, index: true
      t.datetime :time

      t.timestamps
    end
  end
end
