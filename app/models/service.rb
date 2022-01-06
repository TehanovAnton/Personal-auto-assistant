# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :organizations_services, dependent: :destroy
  has_many :organizations, through: :organizations_services

  enum name: {
    'technical inspection': 0,
    'insurance company': 1,
    'design salon': 3
  }

  validates :name, :email, :phone_number, :address, presence: true
  validates :name, uniqueness: true, inclusion: { in: Service.names.keys }
end
