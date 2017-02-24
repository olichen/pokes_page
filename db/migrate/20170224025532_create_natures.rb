class CreateNatures < ActiveRecord::Migration[5.0]
  def change
    create_table :natures do |t|
      t.string :name
      t.integer :increased_stat_id
      t.integer :decreased_stat_id

      t.timestamps
    end
  end
end
