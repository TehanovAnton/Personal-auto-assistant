

module Resolvers
  module Works
    class WorkResolver < Resolvers::BaseResolver
      description "Company work by id"

      type Types::WorkType, null: true

      argument :company_id, ID, required: true
      argument :work_id, ID, required: true

      def resolve(company_id:, work_id:)
        organization = Organization.find_by(id: company_id)

        if organization
          work = organization.works.find { |w| w.id == work_id.to_i }
          return work if work
        end

        nil
      end
    end
  end
end
