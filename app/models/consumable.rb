# frozen_string_literal: true

class Consumable < ApplicationRecord
  has_many :car_consumable_values, dependent: :destroy
  has_many :cars, through: :car_consumable_values

  enum name: { fuel: 0, coolant: 1, 'brake fluid': 2 }

  validates :name, presence: true, inclusion: { in: Consumable.names.keys }
end
