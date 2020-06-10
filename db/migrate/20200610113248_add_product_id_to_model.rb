class AddProductIdToModel < ActiveRecord::Migration[5.2]
  def change
    add_column :models, :product_id, :integer
  end
end
