class AddAttachmentImageToServiceSliders < ActiveRecord::Migration[5.2]
  def self.up
    change_table :service_sliders do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :service_sliders, :image
  end
end
