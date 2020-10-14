class Modification < ApplicationRecord
  attr_accessor :price
  # has_many :modification_complectations, dependent: :nullify
  # has_many :complectations, through: :modification_complectations
  has_many :complectations
  has_many :modification_images
  
  has_many :modification_colors, dependent: :nullify
  has_many :colors, through: :modification_colors
  
  has_many :complectation_colors, dependent: :nullify
  
  belongs_to :model

  def complectations_minimum_price
    @price = self.complectations.minimum(:price_new).to_i
  end
  def complectations_maximum_price
    self.complectations.maximum(:price_new).to_i
  end
  def complectations_diff_price
    @price = self.complectations.minimum(:price_old).to_i - self.complectations.minimum(:price_new).to_i
    @price <= 0 ? 10000 : @price
  end
  def credit_day
    if @price.to_i > 0
      puts "+"*100+"#{@price}"
      (@price.to_i*1/100/30).to_i
    else
      complectations_minimum_price
      puts "="*100+"#{@price}"
      (@price.to_i*1/100/30).to_i
    end
  end
end
