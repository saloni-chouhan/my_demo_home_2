class AddEmailToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :email, :string
  end
end
