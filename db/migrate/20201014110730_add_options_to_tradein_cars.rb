class AddOptionsToTradeinCars < ActiveRecord::Migration[5.2]
  def change
    add_column :tradein_cars, :options, :text
  end
end
