class AddColumnsToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :passport_no, :string
    add_column :bookings, :address, :string
    add_column :bookings, :class_type, :string
    add_column :bookings, :age, :string
    add_column :bookings, :phone, :string
  end
end
