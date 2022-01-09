# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :organization

  has_many :services_works, dependent: :destroy
  has_many :works, through: :services_works

  validates :name, :email, :phone_number, :address, presence: true
  validates :name, uniqueness: true

  def name_in_one_word
    name.gsub(' ', '_')
  end

  def self.original_name(name)
    name.gsub('_', ' ')
  end

  def self.id_by_name(name)
    Service.find_by(name: name).id
  end

  def organization_service_works(organization_id:)
    scope = organizations_services_works_prices.where(organization_id: organization_id).map(&:service_work_id)
    ServiceWork.find(scope)
  end

  def organization_service_work_price(organization_id:, service_work_id:)
    organizations_services_works_prices.find_by(organization_id: organization_id,
                                                service_work_id: service_work_id).price
  end
end
