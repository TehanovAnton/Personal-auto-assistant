# frozen_string_literal: true

# == Schema Information
#
# Table name: cities_organizations
#
#  city_id         :integer
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class CitiesOrganization < ApplicationRecord
  belongs_to :city
  belongs_to :organization
end
