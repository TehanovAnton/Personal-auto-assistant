class Part < ApplicationRecord
  has_many :car_parts, dependent: :destroy
  has_many :cars, through: :car_parts

  validates :name, presence: true
end
