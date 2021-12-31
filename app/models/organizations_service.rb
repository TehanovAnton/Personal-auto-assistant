class OrganizationsService < ApplicationRecord
  belongs_to :organization
  belongs_to :service
end
