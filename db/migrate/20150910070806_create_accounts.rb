class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer  :height
      t.string   :first_name
      t.string   :last_name
      t.date     :date_of_birth
      t.string   :mobile_number
      t.integer  :gender, default: 0
      t.string :address
      t.references :user, index: true
      t.timestamps
    end
  end
end
