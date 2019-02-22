class Ability < ApplicationRecord
  has_and_belongs_to_many :heros
  validates_presence_of :name, :description
end
