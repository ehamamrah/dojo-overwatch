class AddAbilitiesListToHeros < ActiveRecord::Migration[5.2]
  def change
    add_column :heros, :abilities_list, :string, array: true, default: []
  end
end
