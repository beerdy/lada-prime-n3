class Special < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg+xml"]
  has_attached_file :preview
  validates_attachment_content_type :preview, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg+xml"]
end
