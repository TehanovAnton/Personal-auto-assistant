# frozen_string_literal: true

class CitiesOrganization < ApplicationRecord
  belongs_to :city
  belongs_to :organization
end
