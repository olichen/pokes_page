class AddDataSmogonToDataPoke < ActiveRecord::Migration[5.0]
  def change
    add_reference :data_pokes, :data_smogon, foreign_key: true
  end
end
