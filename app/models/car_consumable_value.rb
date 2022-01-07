# frozen_string_literal: true

class CarConsumableValue < ApplicationRecord
  belongs_to :car, dependent: :destroy
  belongs_to :consumable, dependent: :destroy

  delegate :name, to: :consumable

  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0 }

  delegate :id, to: :car, prefix: true
end
