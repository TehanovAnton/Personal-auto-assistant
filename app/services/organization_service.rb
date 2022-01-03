# frozen_string_literal: true

class OrganizationService
  attr_accessor :organization, :cities

  def initialize(organization:, city_ids:)
    @organization = organization
    @cities = city_ids.map { |city_id| City.find_by(id: city_id) }
  end

  def save_organization_and_cities_organization
    return false unless organization.save

    organization_cities
  end

  def update_organization_and_cities_organization(params)
    return false unless organization.update(params)

    organization_cities
  end

  private

  def organization_cities
    organization.cities = cities
  end
end
