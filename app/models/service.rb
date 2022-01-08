# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :organizations_services_works_prices, dependent: :destroy
  has_many :organizations, through: :organizations_services_works_prices
  has_many :service_works, through: :organizations_services_works_prices

  enum name: {
    'technical inspection': 0,
    'insurance company': 1,
    'design salon': 3
  }

  validates :name, :email, :phone_number, :address, presence: true
  validates :name, uniqueness: true, inclusion: { in: Service.names.keys }

  def name_in_one_word
    name.gsub(' ', '_')
  end

  def self.original_name(name)
    name.gsub('_', ' ')
  end

  def self.id_by_name(name)
    Service.find_by(name: name).id
  end
end
