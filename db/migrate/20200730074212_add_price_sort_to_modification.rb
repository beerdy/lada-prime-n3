class AddPriceSortToModification < ActiveRecord::Migration[5.2]
  def change
    add_column :modifications, :price_sort, :integer
  end
end
