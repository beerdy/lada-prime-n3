class AddAttachmentPreviewToSpecials < ActiveRecord::Migration[5.2]
  def self.up
    change_table :specials do |t|
      t.attachment :preview
    end
  end

  def self.down
    remove_attachment :specials, :preview
  end
end
