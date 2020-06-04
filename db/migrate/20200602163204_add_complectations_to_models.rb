class AddComplectationsToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :models, :complectations, :text, array: true
  end
end
