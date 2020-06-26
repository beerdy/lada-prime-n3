class Complectation < ApplicationRecord
  has_many :options, dependent: :destroy
  # belongs_to :model
end
  