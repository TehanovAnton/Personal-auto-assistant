# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :organizations_services_works_price
  belongs_to :car

  has_one :organization, through: :organizations_services_works_price
  has_one :service, through: :organizations_services_works_price
  has_one :service_work, through: :organizations_services_works_price

  has_one :user, through: :car

  delegate :price, to: :organizations_services_works_price
end
