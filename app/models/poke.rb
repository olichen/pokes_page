class Poke < ApplicationRecord
  validates :name,      presence: true
  validates :weight,    presence: true
  validates :order,     presence: true
end
