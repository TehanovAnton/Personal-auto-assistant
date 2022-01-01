class OrganizationService
  def save_organization_and_cities_organizations(organization: Organization.new,
                                                 city_ids: [])
    return false unless organization.valid?

    organization.save

    city_ids.each do |city_id|
      CitiesOrganization.create(city_id: city_id, organization_id: organization.id)
    end
  end
end
