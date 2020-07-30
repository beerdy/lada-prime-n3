class AddAttachmentImageToModificationImages < ActiveRecord::Migration[5.2]
  def self.up
    change_table :modification_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :modification_images, :image
  end
end
