class AddBaseIdToModificationImage < ActiveRecord::Migration[5.2]
  def change
    add_column :modification_images, :base_id, :string
  end
end
