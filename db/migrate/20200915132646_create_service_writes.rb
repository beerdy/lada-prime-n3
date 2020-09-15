class CreateServiceWrites < ActiveRecord::Migration[5.2]
  def change
    create_table :service_writes do |t|
      t.string :name
      t.string :phone
      t.string :model
      t.string :year
      t.string :work
      t.string :mileage
      t.string :link
      t.string :url
      t.integer :sort
      t.boolean :show

      t.timestamps
    end
  end
end
