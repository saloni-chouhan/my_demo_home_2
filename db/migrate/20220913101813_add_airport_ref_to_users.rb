class AddAirportRefToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :airports, foreign_key: true
  end
end
