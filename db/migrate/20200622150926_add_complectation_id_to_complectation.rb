class AddComplectationIdToComplectation < ActiveRecord::Migration[5.2]
  def change
    add_column :complectations, :complectation_id, :integer
  end
end
