class CreateSpecifications < ActiveRecord::Migration[5.2]
  def change
    create_table :specifications do |t|
      t.string :base_id
      t.string :name
      t.references :modification, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
