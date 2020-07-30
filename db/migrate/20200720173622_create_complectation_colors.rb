class CreateComplectationColors < ActiveRecord::Migration[5.2]
  def change
    create_table :complectation_colors do |t|
      t.references :color, foreign_key: true
      t.references :complectation, foreign_key: true
      t.boolean :stock
    end
  end
end
