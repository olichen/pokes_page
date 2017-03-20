class RemoveCutoffDeviationFromDataSmogon < ActiveRecord::Migration[5.0]
  def change
    remove_column :data_smogons, :cutoff_deviation, :float
  end
end
