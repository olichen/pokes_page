class CreateDataSmogons < ActiveRecord::Migration[5.0]
  def change
    create_table :data_smogons do |t|
      t.float :cutoff
      t.float :cutoff_deviation
      t.string :metagame
      t.integer :num_battles
      t.date :month

      t.timestamps
    end
  end
end
