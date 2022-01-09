# frozen_string_literal: true

class OrganizationsWork < ApplicationRecord
  belongs_to :organization
  belongs_to :work
end
