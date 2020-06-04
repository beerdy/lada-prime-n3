class AddBonusToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :bonus, :string
  end
end
