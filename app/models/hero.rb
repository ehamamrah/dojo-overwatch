class Hero < ApplicationRecord
  has_and_belongs_to_many :abilities

  validates_presence_of :name, :real_name, :health, :armour, :shield
  validates_numericality_of :health, :armour, :shield
end
