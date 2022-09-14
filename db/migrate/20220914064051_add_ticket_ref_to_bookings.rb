class AddTicketRefToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :ticket, foreign_key: true
  end
end
