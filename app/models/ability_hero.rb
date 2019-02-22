class AbilityHero < ApplicationRecord
  belongs_to :hero
  belongs_to :ability

  self.table_name = 'abilities_heros'
end
