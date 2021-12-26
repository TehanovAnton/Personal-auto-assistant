class City < ApplicationRecord
  has_many :cities_organizations, dependent: :destroy
  has_many :organizations, through: :cities_organizations
end
