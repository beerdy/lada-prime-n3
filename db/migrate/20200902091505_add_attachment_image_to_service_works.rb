class AddAttachmentImageToServiceWorks < ActiveRecord::Migration[5.2]
  def self.up
    change_table :service_works do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :service_works, :image
  end
end
