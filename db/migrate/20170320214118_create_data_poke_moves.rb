class CreateDataPokeMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :data_poke_moves do |t|
      t.references :move, foreign_key: true
      t.references :data_poke, foreign_key: true
      t.float :usage

      t.timestamps
    end
  end
end
