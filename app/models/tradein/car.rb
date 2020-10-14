class Tradein::Car < ApplicationRecord
  has_many :car_images, foreign_key: :tradein_car_id, :dependent => :destroy
end
