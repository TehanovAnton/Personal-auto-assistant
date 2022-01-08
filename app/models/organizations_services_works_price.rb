# frozen_string_literal: true

class OrganizationsServicesWorksPrice < ApplicationRecord
  belongs_to :organization
  belongs_to :service
  belongs_to :service_work

  delegate :name, to: :service
  delegate :title, to: :service_work

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
