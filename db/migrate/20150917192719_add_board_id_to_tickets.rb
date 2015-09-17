class AddBoardIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :board_id, :integer
    add_index  :tickets, :board_id
  end
end
