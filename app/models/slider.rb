class Slider < ApplicationRecord
  has_attached_file :gallery,
    :styles => {
      :thumb => "100x100#",
      :small  => "150x150>",
      :medium => "200x200" }
  validates_attachment_content_type :gallery, :content_type => /\Aimage\/.*\Z/
  # add a delete_<asset_name> method: 
  attr_accessor :delete_gallery
  before_validation { self.gallery.clear if self.delete_gallery == '1' }
end
