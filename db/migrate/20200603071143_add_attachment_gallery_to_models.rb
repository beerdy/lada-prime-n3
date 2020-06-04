class AddAttachmentGalleryToModels < ActiveRecord::Migration[5.2]
  def self.up
    change_table :models do |t|
      t.attachment :gallery
    end
  end

  def self.down
    remove_attachment :models, :gallery
  end
end
