class AddNameAndAgeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :age, :integer
  	add_column :users, :height, :integer
  end
end
