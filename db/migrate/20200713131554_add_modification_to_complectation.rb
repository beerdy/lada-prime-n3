class AddModificationToComplectation < ActiveRecord::Migration[5.2]
  def change
    add_reference :complectations, :modification, foreign_key: true
  end
end
