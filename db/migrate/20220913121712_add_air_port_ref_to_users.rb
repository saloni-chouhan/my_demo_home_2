class AddAirPortRefToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :airport, foreign_key: true
  end
end
