# frozen_string_literal: true

class Organization < ApplicationRecord
  has_many :cities_organizations
  has_many :cities, through: :cities_organizations
end
