class CreateAirlines < ActiveRecord::Migration[5.1]
  def change
    create_table :airlines do |t|
      t.string :name
      t.string :airline_type

      t.timestamps
    end
  end
end
