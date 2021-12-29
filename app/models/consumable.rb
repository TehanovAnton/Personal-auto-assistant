class Consumable < ApplicationRecord
  has_many :car_consumable_values
  has_many :cars, through: :car_consumable_values
end
