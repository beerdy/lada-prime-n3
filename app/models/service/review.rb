class Service::Review < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg+xml"]
end
