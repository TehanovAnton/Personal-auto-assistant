class Car < ApplicationRecord
  has_many :car_parts, dependent: :destroy
  has_many :parts, through: :car_parts
end
