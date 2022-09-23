class RemovePassportColumnFromTickets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :passport_no, :string
  end
end
