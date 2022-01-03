class CarConsumableValue < ApplicationRecord
  belongs_to :car, dependent: :destroy
  belongs_to :consumable, dependent: :destroy

  validates :value, numericality: { greater_than: 0 }
end
