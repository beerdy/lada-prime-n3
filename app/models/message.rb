class Message < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true
end
