# frozen_string_literal: true

class Part < ApplicationRecord
  has_many :car_parts, dependent: :destroy
  has_many :cars, through: :car_parts

  enum name: { engine: 0,  motor: 1, brakes: 2 }

  validates :name, presence: true, inclusion: { in: Part.names.keys }
end
