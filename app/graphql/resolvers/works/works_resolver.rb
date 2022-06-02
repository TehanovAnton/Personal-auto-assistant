# frozen_string_literal: true

module Resolvers
  module Works
    class WorksResolver < Resolvers::BaseResolver
      description 'Company works'

      type [Types::WorkType], null: true

      argument :company_id, ID, required: true

      def resolve(company_id:)
        organization = Organization.find_by(id: company_id)

        return organization.works if organization

        nil
      end
    end
  end
end
