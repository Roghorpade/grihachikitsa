class AddSpecializationToDoctors < ActiveRecord::Migration
  def change
  	add_column :users, :specialization, :string
  end
end
