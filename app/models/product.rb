class Product < ApplicationRecord
  has_attached_file :gallery
  validates_attachment_content_type :gallery, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg+xml"]
  
  belongs_to :model

  rails_admin do
    include_all_fields
    exclude_fields  :created_at, :updated_at
    field :finish, :date do
      # ...
      strftime_format '%m %d %Y'
      # partial 'date_partial.html.haml'
      # ...
    end
  end 
end
