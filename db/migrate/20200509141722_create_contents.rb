class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :description
      t.text :slave
      t.string :link
      t.string :url
      t.integer :sort
      t.boolean :show

      t.timestamps
    end
  end
end
