# frozen_string_literal: true

module Resolvers
  module Services
    class ServicesResolver < Resolvers::BaseResolver
      description 'Organization services'

      type [Types::ServiceType], null: true

      argument :organization_id, ID, required: true

      def resolve(organization_id:)
        organization = Organization.find_by(id: organization_id)

        return organization.services if organization

        nil
      end
    end
  end
end
