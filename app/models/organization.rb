# frozen_string_literal: true

class Organization < ApplicationRecord
  has_many :cities_organizations, dependent: :destroy
  has_many :cities, through: :cities_organizations

  has_many :organizations_services_works_prices, dependent: :destroy
  has_many :services, through: :organizations_services_works_prices

  belongs_to :service_owner

  validates :address, :email, :name, :phone_number, presence: true, uniqueness: true

  def all_services?
    services.count == Service.count
  end
end
