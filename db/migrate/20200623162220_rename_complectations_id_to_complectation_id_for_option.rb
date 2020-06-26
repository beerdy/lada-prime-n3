class RenameComplectationsIdToComplectationIdForOption < ActiveRecord::Migration[5.2]
  def change
    rename_column :options, :complectations_id, :complectation_id
  end
end
