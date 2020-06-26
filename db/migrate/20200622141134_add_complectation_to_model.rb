class AddComplectationToModel < ActiveRecord::Migration[5.2]
  def change
    add_reference :models, :complectation, foreign_key: true
  end
end
