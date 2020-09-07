class CreateTradeinCars < ActiveRecord::Migration[5.2]
  def change
    create_table :tradein_cars do |t|
      t.string :title
      t.text :description
      t.string :engine
      t.integer :clapan
      t.integer :power
      t.string :transmission
      t.string :type
      t.string :color
      t.string :type
      t.integer :owners
      t.integer :millage
      t.string :case
      t.string :drive
      t.integer :year
      t.string :condition
      t.string :price_new
      t.string :price_old
      t.string :link
      t.string :url
      t.integer :sort
      t.boolean :show

      t.timestamps
    end
  end
end
