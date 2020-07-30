class AddCodeToComplectationColors < ActiveRecord::Migration[5.2]
  def change
    add_column :complectation_colors, :code, :string
  end
end
