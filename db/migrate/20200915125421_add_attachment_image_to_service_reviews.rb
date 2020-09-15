class AddAttachmentImageToServiceReviews < ActiveRecord::Migration[5.2]
  def self.up
    change_table :service_reviews do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :service_reviews, :image
  end
end
