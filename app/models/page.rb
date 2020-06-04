class Page < ApplicationRecord

  rails_admin do
    include_all_fields
    exclude_fields  :created_at, :updated_at
    field :description, :ck_editor #, :ckeditor => { :toolbar => 'mini' } 
  end
end
