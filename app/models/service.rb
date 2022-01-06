# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :organizations_services, dependent: :destroy
  has_many :organizations, through: :organizations_services
end
