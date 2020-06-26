class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.string :property
      t.text :name
      t.string :link
      t.string :url
      t.integer :sort
      t.boolean :show
    end
  end
end
