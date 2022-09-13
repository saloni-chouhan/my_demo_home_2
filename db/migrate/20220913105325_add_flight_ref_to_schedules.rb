class AddFlightRefToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_reference :schedules, :flight, foreign_key: true
  end
end
