# frozen_string_literal: true

module Mutations
  module Services
    class ServiceUpdate < BaseMutation
      description "Updates a service by id"
  
      field :service, Types::ServiceType, null: false
  
      argument :id, ID, required: true
      argument :service_input, Types::Inputs::ServiceInputType, required: true
  
      def resolve(id:, service_input:)
        service = ::Service.find(id)
        raise GraphQL::ExecutionError.new "Error updating service", extensions: service.errors.to_hash unless service.update(**service_input)
  
        { service: service }
      end
    end
  end
end
