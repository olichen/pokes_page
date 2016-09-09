class CreatePokes < ActiveRecord::Migration[5.0]
  def change
    create_table :pokes do |t|
      t.string :name
      t.integer :weight
      t.integer :order

      t.timestamps
    end
  end
end
