class AddModificationToModificationImage < ActiveRecord::Migration[5.2]
  def change
    add_reference :modification_images, :modification, foreign_key: true
  end
end
