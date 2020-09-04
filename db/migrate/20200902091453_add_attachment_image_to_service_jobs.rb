class AddAttachmentImageToServiceJobs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :service_jobs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :service_jobs, :image
  end
end
