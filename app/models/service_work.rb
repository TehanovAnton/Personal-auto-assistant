class ServiceWork < ApplicationRecord
  has_many :organizations_services_works_prices, dependent: :destroy
  has_many :services, through: :organizations_services_works_prices
end
