# frozen_string_literal: true

module Mutations
  module Services
    class ServiceDelete < BaseMutation
      description 'Deletes a service by ID'

      field :service, Types::ServiceType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        service = ::Service.find(id)
        unless service.destroy
          raise GraphQL::ExecutionError.new 'Error deleting service',
                                            extensions: service.errors.to_hash
        end

        { service: service }
      end
    end
  end
end
