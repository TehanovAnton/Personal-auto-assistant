# frozen_string_literal: true

module Mutations
  module Cars
    class CarCreate < BaseMutation
      description 'Creates a new car'

      field :car, Types::CarType, null: false

      argument :car_input, Types::Inputs::CarInputType, required: true

      def resolve(car_input:)
        car = ::Car.new(**car_input)
        unless car.save
          raise GraphQL::ExecutionError.new 'Error creating car',
                                            extensions: car.errors.to_hash
        end

        { car: car }
      end
    end
  end
end
