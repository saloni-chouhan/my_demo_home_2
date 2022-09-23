class ChangeColumnClassToClassTypeInTickets < ActiveRecord::Migration[5.1]
  def change
    rename_column :tickets, :class, :class_type
  end
end
