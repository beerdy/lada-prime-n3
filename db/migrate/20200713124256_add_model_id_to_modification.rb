class AddModelIdToModification < ActiveRecord::Migration[5.2]
  def change
    add_reference :modifications, :model, foreign_key: true
  end
end
