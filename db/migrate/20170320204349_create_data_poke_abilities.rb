class CreateDataPokeAbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :data_poke_abilities do |t|
      t.references :ability, foreign_key: true
      t.references :data_poke, foreign_key: true
      t.float :usage

      t.timestamps
    end
  end
end
