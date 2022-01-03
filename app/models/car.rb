class Car < ApplicationRecord
  has_many :car_consumable_values, dependent: :destroy
  has_many :consumables, through: :car_consumable_values

  belongs_to :user

  enum fuel_type: { electricity: 0, gas: 1, petrol: 2 }
  enum transmission_type: { mechanic: 0, automatic: 1 }
end
