class Engine < ApplicationRecord
  belongs_to :modification
  has_many :specifications
end
