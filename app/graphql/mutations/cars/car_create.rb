# frozen_string_literal: true

module Mutations
  class Cars::CarCreate < BaseMutation
    description "Creates a new car"

    field :car, Types::CarType, null: false

    argument :car_input, Types::Inputs::CarInputType, required: true

    def resolve(car_input:)
      car = ::Car.new(**car_input)
      raise GraphQL::ExecutionError.new "Error creating car", extensions: car.errors.to_hash unless car.save

      { car: car }
    end
  end
end
