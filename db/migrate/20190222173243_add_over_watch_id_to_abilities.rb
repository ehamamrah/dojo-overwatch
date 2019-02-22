class AddOverWatchIdToAbilities < ActiveRecord::Migration[5.2]
  def change
    add_column :abilities, :overwatch_id, :integer
  end
end
