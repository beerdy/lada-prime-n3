class AddBaseIdToModification < ActiveRecord::Migration[5.2]
  def change
    add_column :modifications, :base_id, :string
  end
end
