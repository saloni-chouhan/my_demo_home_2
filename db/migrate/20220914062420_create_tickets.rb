class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :seatno
      t.string :class
      t.string :source
      t.string :destination
      t.string :flight_name
      t.string :passport_no

      t.timestamps
    end
  end
end
