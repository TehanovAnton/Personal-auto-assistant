
module Resolvers
  module Services
    class ServicesResolver < Resolvers::BaseResolver
      description "Company services"

      type [Types::ServiceType], null: true

      argument :company_id, ID, required: true

      def resolve(company_id:)
        organization = Organization.find_by(id: company_id)
        
        return organization.services if organization
        nil
      end
    end
  end
end
