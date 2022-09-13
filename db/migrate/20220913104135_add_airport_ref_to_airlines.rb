class AddAirportRefToAirlines < ActiveRecord::Migration[5.1]
  def change
    add_reference :airlines, :airport, foreign_key: true
  end
end
