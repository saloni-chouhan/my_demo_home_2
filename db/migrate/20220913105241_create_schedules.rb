class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.datetime :d_time
      t.datetime :a_time
      t.string :duration

      t.timestamps
    end
  end
end
