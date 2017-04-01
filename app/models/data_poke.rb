class DataPoke < ApplicationRecord
  belongs_to :poke
  has_many :data_poke_abilities
  has_many :abilities, through: :data_poke_abilities
  has_many :data_poke_items
  has_many :items, through: :datapokeitems
  has_many :data_poke_teammates
  has_many :teammates, through: :data_poke_teammates, source: :poke
  has_one :data_viability
end
