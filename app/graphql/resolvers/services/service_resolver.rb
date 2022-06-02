

module Resolvers
  module Services
    class ServiceResolver < Resolvers::BaseResolver
      description "Company service by id"

      type Types::ServiceType, null: true

      argument :company_id, ID, required: true
      argument :service_id, ID, required: true

      def resolve(company_id:, service_id:)
        organization = Organization.find_by(id: company_id)
        
        if organization
          service = organization.services.find { |s| s.id == service_id.to_i }
          return service if service
        end

        nil
      end
    end
  end
end
