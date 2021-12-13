class City < ApplicationRecord
  has_many :city_organizaations
  has_many :organizaations, through: :city_organizaations
end
