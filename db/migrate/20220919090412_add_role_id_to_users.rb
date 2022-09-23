class AddRoleIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :role, null: true, foreign_key: true
    remove_column :users, :designation, :string
  end
end
