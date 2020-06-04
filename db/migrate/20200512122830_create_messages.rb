class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :title
      t.string :name
      t.text :description
      t.text :slave
      t.string :phone

      t.timestamps
    end
  end
end
