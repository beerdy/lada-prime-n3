class ModificationImage < ApplicationRecord
  include DownloadImage

  belongs_to :color
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
  
  # For parser
  def picture_from_link( link )
    # sleep ONE seconds for next request download image
    sleep 1

    downloader = Downloader.new
    downloader.start link

    if downloader.image_downloaded?
      self.image = downloader.image
      return true
    else
      return false
    end
  end
end
