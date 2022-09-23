class RemoveFlightNameFromTickets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :flight_name, :string
  end
end
