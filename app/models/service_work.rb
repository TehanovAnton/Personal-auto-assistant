# frozen_string_literal: true

class ServiceWork < ApplicationRecord
  has_many :organizations_services_works_prices, dependent: :destroy
  has_many :services, through: :organizations_services_works_prices

  validates :name, precense: true, uniqueness: true
end
