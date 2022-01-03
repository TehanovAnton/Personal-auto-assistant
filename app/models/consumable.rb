class Consumable < ApplicationRecord
  has_many :car_consumable_values, dependent: :destroy
  has_many :cars, through: :car_consumable_values

  validates :name, presence: true
end
