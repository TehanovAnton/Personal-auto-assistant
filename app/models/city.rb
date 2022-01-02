# frozen_string_literal: true

class City < ApplicationRecord
  has_many :cities_organizations
  has_many :organizations, through: :cities_organizations
end
