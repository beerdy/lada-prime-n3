class ChangeMillageToMileage < ActiveRecord::Migration[5.2]
  def change
	rename_column :tradein_cars, :millage, :mileage
  end
end
