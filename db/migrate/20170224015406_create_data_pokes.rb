class CreateDataPokes < ActiveRecord::Migration[5.0]
  def change
    create_table :data_pokes do |t|
      t.references :poke, foreign_key: true
      t.integer :count
      t.float :usage

      t.timestamps
    end
  end
end
