class AddColorsToComplectations < ActiveRecord::Migration[5.2]
  def change
    add_column :complectations, :colors, :string
  end
end
