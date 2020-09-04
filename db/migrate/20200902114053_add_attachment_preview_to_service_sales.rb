class AddAttachmentPreviewToServiceSales < ActiveRecord::Migration[5.2]
  def self.up
    change_table :service_sales do |t|
      t.attachment :preview
    end
  end

  def self.down
    remove_attachment :service_sales, :preview
  end
end
