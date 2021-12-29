class Car < ApplicationRecord
  has_many :car_consumable_values, dependent: :destroy
  has_many :consumables, through: :car_consumable_values
end
