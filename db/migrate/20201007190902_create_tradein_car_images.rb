class CreateTradeinCarImages < ActiveRecord::Migration[5.2]
  def change
    create_table :tradein_car_images do |t|
      t.references :tradein_car, foreign_key: true

      t.timestamps
    end
  end
end
