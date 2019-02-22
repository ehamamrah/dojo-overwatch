class CreateJoinTableHerosAbilities < ActiveRecord::Migration[5.2]
  def change
    create_join_table :heros, :abilities do |t|
      t.index [:hero_id, :ability_id]
      t.index [:ability_id, :hero_id]
    end
  end
end
