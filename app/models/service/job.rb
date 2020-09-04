class Service::Job < ApplicationRecord
  # Fix the foreign key manually of namespaces nested tables for "rails_admin"
  has_many :works, foreign_key: :service_job_id
  before_save :convert_title_to_link

  has_attached_file :image
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg+xml"]
  
  private
    def convert_title_to_link
      self.link =  Russian.translit( self.title ).parameterize 
    end
end
