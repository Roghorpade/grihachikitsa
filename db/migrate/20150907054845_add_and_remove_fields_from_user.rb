class AddAndRemoveFieldsFromUser < ActiveRecord::Migration
  def up
  	remove_column :users, :name
  	remove_column :users, :age
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :date_of_birth, :date
    add_column :users, :mobile_number, :string
    add_column :users, :gender, :integer, default: 0
    add_column :users, :steps_passed, :boolean, default: false
  end

  def down
  	add_column :users, :name, :string
  	add_column :users, :age, :integer
  	remove_column :users, :first_name
  	remove_column :users, :last_name
  	remove_column :users, :date_of_birth
    remove_column :users, :mobile_number
    remove_column :users, :gender
    remove_column :users, :steps_passed
  end
end
