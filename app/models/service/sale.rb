class Service::Sale < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg+xml"]
  has_attached_file :preview
  validates_attachment_content_type :preview, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg+xml"]
  
  rails_admin do
    include_all_fields
    exclude_fields  :created_at, :updated_at
    field :description, :ck_editor #, :ckeditor => { :toolbar => 'mini' } 
  end
end
