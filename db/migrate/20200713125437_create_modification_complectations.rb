class CreateModificationComplectations < ActiveRecord::Migration[5.2]
  def change
    create_table :modification_complectations do |t|
      t.references :modification, foreign_key: true
      t.references :complectation, foreign_key: true
    end
  end
end
