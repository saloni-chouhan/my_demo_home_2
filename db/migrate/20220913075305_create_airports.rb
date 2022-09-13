class CreateAirports < ActiveRecord::Migration[5.1]
  def change
    create_table :airports do |t|
      t.string :airport_name
      t.string :country
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
