class CreateComplectationOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :complectation_options do |t|
      t.references :complectation, foreign_key: true
      t.references :option, foreign_key: true
    end
  end
end
