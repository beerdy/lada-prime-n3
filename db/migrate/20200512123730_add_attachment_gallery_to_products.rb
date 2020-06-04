class AddAttachmentGalleryToProducts < ActiveRecord::Migration[5.2]
  def self.up
    change_table :products do |t|
      t.attachment :gallery
    end
  end

  def self.down
    remove_attachment :products, :gallery
  end
end
