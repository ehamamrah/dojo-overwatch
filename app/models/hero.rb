class Hero < ApplicationRecord
  validates_presence_of :name, :real_name, :health, :armour, :shield
  validates_numericality_of :health, :armour, :shield
end
