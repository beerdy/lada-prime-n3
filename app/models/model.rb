class Model < ApplicationRecord
  include DownloadImage

  before_save :convert_model_to_url

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]

  belongs_to :product, optional: true
  
  has_many :modifications
  has_many :complectations
  
  # For parser
  def picture_from_link(link)
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
    
  def complectations_minimum_price
    self.complectations.minimum(:price_new).to_i
  end
  def complectations_maximum_price
    self.complectations.maximum(:price_new).to_i
  end

  def self.complectations_minimum_price
    300000
  end
  def self.complectations_maximum_price
    1700000
  end

  private
    def convert_model_to_url
      self.url = self.model.parameterize 
    end
end
