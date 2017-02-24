class CreateDataViabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :data_viabilities do |t|
      t.integer :numplayers
      t.integer :gxe_top
      t.integer :gxe_99
      t.integer :gxe_95
      t.references :data_poke, foreign_key: true

      t.timestamps
    end
  end
end
