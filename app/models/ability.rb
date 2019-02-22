class Ability < ApplicationRecord
  validates_presence_of :name, :description, :is_ultimate
end
