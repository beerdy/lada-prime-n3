class AddAttachmentImageToServiceSales < ActiveRecord::Migration[5.2]
  def self.up
    change_table :service_sales do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :service_sales, :image
  end
end
