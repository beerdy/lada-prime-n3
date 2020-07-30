class Complectation < ApplicationRecord
  include ComplectationProperties

  has_many :complectation_options, dependent: :nullify
  has_many :options, through: :complectation_options

  has_many :complectation_colors

  belongs_to :modification

  def name
    begin
      self.title[" / "] = " | "
    rescue Exception => e
    end
    self.title.split(" | ")[1].upcase
  end
  def subname 
    self.title.split(' | ')[0]
  end
  def diff_price
    price = self.price_old.to_i - self.price_new.to_i
    price <= 0 ? 5000 : price
  end
  def credit_day
    (self.price_new.to_i*1/100/30).to_i
  end
  def options_properties
    ComplectationProperties::OptionsProperties.new( self.options ).make
  end
end
  