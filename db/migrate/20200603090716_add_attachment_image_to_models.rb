class AddAttachmentImageToModels < ActiveRecord::Migration[5.2]
  def self.up
    change_table :models do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :models, :image
  end
end
