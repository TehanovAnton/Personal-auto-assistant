# frozen_string_literal: true

module Resolvers
  module Organizations
    class OrganizationsResolver < Resolvers::BaseResolver
      description 'Service owmer organizations'

      type [Types::OrganizationType], null: true

      argument :service_owner_id, ID, required: true

      def resolve(service_owner_id:)
        service_owner = ServiceOwner.find_by(id: service_owner_id)

        return service_owner.organizations if service_owner

        nil
      end
    end
  end
end
