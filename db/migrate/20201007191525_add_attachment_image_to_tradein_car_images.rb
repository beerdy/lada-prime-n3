class AddAttachmentImageToTradeinCarImages < ActiveRecord::Migration[5.2]
  def self.up
    change_table :tradein_car_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tradein_car_images, :image
  end
end
