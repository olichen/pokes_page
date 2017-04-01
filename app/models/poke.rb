class Poke < ApplicationRecord
  validates :name,      presence: true, uniqueness: true
end
