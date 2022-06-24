# frozen_string_literal: true

module Resolvers
  module Works
    class WorksResolver < Resolvers::BaseResolver
      description 'Company works'

      type [Types::WorkType], null: true

      argument :organization_id, ID, required: true

      def resolve(organization_id:)
        organization = Organization.find_by(id: organization_id)

        return organization.works if organization

        nil
      end
    end
  end
end
