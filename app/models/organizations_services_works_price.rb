# frozen_string_literal: true

class OrganizationsServicesWorksPrice < ApplicationRecord
  belongs_to :organization
  belongs_to :service
  belongs_to :service_work
end
