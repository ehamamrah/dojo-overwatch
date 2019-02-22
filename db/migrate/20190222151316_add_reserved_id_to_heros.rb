class AddReservedIdToHeros < ActiveRecord::Migration[5.2]
  def change
    add_column :heros, :reserved_id, :integer
  end
end
