class AddAttachmentGalleryToSliders < ActiveRecord::Migration[5.2]
  def self.up
    change_table :sliders do |t|
      t.attachment :gallery
    end
  end

  def self.down
    remove_attachment :sliders, :gallery
  end
end
