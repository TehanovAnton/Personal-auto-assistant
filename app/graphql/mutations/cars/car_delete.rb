# frozen_string_literal: true

module Mutations
  module Cars
    class CarDelete < BaseMutation
      description 'Deletes a car by ID'

      field :car, Types::CarType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        car = ::Car.find(id)
        unless car.destroy
          raise GraphQL::ExecutionError.new 'Error deleting car',
                                            extensions: car.errors.to_hash
        end

        { car: car }
      end
    end
  end
end
