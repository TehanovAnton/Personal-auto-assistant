class Service < ApplicationRecord
  has_many :organizations_services_works_prices, dependent: :destroy
  has_many :organizations, through: :organizations_services_works_prices
  has_many :service_works, through: :organizations_services_works_prices
end
