class AddComplectationsToOptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :options, :complectations, foreign_key: true
  end
end
