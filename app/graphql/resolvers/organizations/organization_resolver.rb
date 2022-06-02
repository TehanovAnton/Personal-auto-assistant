# frozen_string_literal: true

module Resolvers
  module Organizations
    class OrganizationResolver < Resolvers::BaseResolver
      description 'Service owmer organization by id'

      type Types::OrganizationType, null: true

      argument :service_owner_id, ID, required: true
      argument :organization_id, ID, required: true

      def resolve(service_owner_id:, organization_id:)
        service_owner = ServiceOwner.find_by(id: service_owner_id)

        if service_owner
          organization = service_owner.organizations.find_by(id: organization_id)
          return organization if organization
        end

        nil
      end
    end
  end
end
