# frozen_string_literal: true

module Mutations
  module Services
    class ServiceCreate < BaseMutation
      description 'Creates a new service'

      field :service, Types::ServiceType, null: false

      argument :service_input, Types::Inputs::ServiceInputType, required: true

      def resolve(service_input:)
        service = ::Service.new(**service_input)
        unless service.save
          raise GraphQL::ExecutionError.new 'Error creating service',
                                            extensions: service.errors.to_hash
        end

        { service: service }
      end
    end
  end
end
