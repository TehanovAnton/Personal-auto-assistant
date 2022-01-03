class Car < ApplicationRecord
  has_many :car_consumable_values, dependent: :destroy
  has_many :consumables, through: :car_consumable_values

  belongs_to :user

  enum fuel_type: { electricity: 0, gas: 1, petrol: 2 }
  enum transmission_type: { mechanic: 0, automatic: 1 }

  validates :model, :year_production, :engine_volume,
            :mileage, :body_type, :fuel_type,
            :transmission_type, :maker, :vin,
            presence: true

  validates :vin, uniqueness: true
  validates :engine_volume, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3.5 }
  validates :fuel_type, inclusion: { in: Car.fuel_types.keys }
  validates :transmission_type, inclusion: { in: Car.transmission_types.keys }
end
