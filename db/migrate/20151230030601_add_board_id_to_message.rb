class AddBoardIdToMessage < ActiveRecord::Migration
  def change

	add_column :messages, :board_id, :integer

  end
end
