class CarConsumableValue < ApplicationRecord
  belongs_to :car, dependent: :destroy
  belongs_to :consumable, dependent: :destroy
end
