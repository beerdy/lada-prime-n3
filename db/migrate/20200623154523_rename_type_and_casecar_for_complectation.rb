class RenameTypeAndCasecarForComplectation < ActiveRecord::Migration[5.2]
  def change
    rename_column :complectations, :type, :order
    rename_column :complectations, :case, :casecar
  end
end
