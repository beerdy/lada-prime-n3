class AddCommentsAndModelAndLineupAndCapacityAndWheelAndPriceAndSlaveAndStringAndPhotosToTradeinCars < ActiveRecord::Migration[5.2]
  def change
    add_column :tradein_cars, :comments, :text
    add_column :tradein_cars, :model, :string
    add_column :tradein_cars, :lineup, :string
    add_column :tradein_cars, :capacity, :string
    add_column :tradein_cars, :wheel, :string
    add_column :tradein_cars, :price, :integer
    add_column :tradein_cars, :slave, :string
    add_column :tradein_cars, :string, :string
  end
end
