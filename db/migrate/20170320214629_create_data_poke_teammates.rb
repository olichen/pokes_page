class CreateDataPokeTeammates < ActiveRecord::Migration[5.0]
  def change
    create_table :data_poke_teammates do |t|
      t.references :poke, foreign_key: true
      t.references :data_poke, foreign_key: true
      t.float :usage

      t.timestamps
    end
  end
end
