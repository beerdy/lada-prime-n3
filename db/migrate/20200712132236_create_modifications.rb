class CreateModifications < ActiveRecord::Migration[5.2]
  def change
    create_table :modifications do |t|
      t.string :name
      t.string :second_name
      t.string :anchor_name
      t.string :link_about
      t.string :link_complectations
      t.text :description
      t.boolean :show
      t.integer :sort

      t.timestamps
    end
  end
end
