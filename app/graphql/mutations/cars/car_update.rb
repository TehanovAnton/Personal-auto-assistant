# frozen_string_literal: true

module Mutations
  module Cars
    class CarUpdate < BaseMutation
      description 'Updates a car by id'

      field :car, Types::CarType, null: false

      argument :id, ID, required: true
      argument :car_input, Types::Inputs::CarInputType, required: true

      def resolve(id:, car_input:)
        car = ::Car.find(id)
        unless car.update(**car_input)
          raise GraphQL::ExecutionError.new 'Error updating car',
                                            extensions: car.errors.to_hash
        end

        { car: car }
      end
    end
  end
end
