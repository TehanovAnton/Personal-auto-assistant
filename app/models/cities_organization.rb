class CitiesOrganization < ApplicationRecord
  belongs_to :city
  belongs_to :organization
end
