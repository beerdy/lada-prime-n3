class AddColorToModificationImage < ActiveRecord::Migration[5.2]
  def change
    add_reference :modification_images, :color, foreign_key: true
  end
end
