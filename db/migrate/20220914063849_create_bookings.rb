class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :name_of_passenger
      t.string :price
      t.string :source
      t.string :destination

      t.timestamps
    end
  end
end
