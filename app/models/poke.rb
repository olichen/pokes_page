class Poke < ApplicationRecord
  validates :name,      presence: true, uniqueness: true
  validates :weight,    presence: true
  validates :order,     uniqueness: true
end
