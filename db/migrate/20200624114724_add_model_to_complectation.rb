class AddModelToComplectation < ActiveRecord::Migration[5.2]
  def change
    add_reference :complectations, :model, foreign_key: true
  end
end
