class AddAttachmentGalleryToProjects < ActiveRecord::Migration[5.2]
  def self.up
    change_table :projects do |t|
      t.attachment :gallery
    end
  end

  def self.down
    remove_attachment :projects, :gallery
  end
end
