class Color < ApplicationRecord
  has_many :modification_colors, dependent: :nullify
  has_many :modifications, through: :modification_colors
end