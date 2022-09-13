class RemoveAirportRefFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :airports, foreign_key: true
  end
end
