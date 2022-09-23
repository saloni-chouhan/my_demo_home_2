class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :string
    add_column :users, :phone, :string
    add_column :users, :designation, :string
  end
end
