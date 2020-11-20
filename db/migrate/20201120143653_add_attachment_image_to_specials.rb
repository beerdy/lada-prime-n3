class AddAttachmentImageToSpecials < ActiveRecord::Migration[5.2]
  def self.up
    change_table :specials do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :specials, :image
  end
end
