class AddPriceToModel < ActiveRecord::Migration[5.2]
  def change
    add_column :models, :price, :string
  end
end
