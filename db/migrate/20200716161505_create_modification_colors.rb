class CreateModificationColors < ActiveRecord::Migration[5.2]
  def change
    create_table :modification_colors do |t|
      t.references :color, foreign_key: true
      t.references :modification, foreign_key: true
    end
  end
end
