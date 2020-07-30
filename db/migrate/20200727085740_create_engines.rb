class CreateEngines < ActiveRecord::Migration[5.2]
  def change
    create_table :engines do |t|
      t.string :name
      t.string :base_id
      t.references :modification, foreign_key: true

      t.timestamps
    end
  end
end
