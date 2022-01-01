class Organization < ApplicationRecord
  has_many :cities_organizations, dependent: :destroy
  has_many :cities, through: :cities_organizations

  has_many :organizations_services_works_prices, dependent: :destroy
  has_many :services, through: :organizations_services_works_prices

  validates :adress, :email, :name, :phone_number, presence: true
  validates :adress, :email, :name, :phone_number, uniqueness: true
end
