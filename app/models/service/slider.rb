class Service::Slider < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg+xml"]
  before_save :convert_link_to_code
  private
    def convert_link_to_code
      begin
        self.slave =  self.url.split('=')[1]
      rescue Exception => e
        Rails.logger.debug "No YouTube video found"
      end
    end
end
