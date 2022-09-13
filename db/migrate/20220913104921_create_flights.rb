class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.string :name
      t.string :source
      t.string :destination
      t.string :status

      t.timestamps
    end
  end
end
