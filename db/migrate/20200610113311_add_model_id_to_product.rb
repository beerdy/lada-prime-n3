class AddModelIdToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :model_id, :integer
  end
end
