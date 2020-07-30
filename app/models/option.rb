class Option < ApplicationRecord
  has_many :complectation_options, dependent: :nullify
  has_many :complectations, through: :complectation_options
end