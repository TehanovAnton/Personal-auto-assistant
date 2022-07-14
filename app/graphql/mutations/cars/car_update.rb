# frozen_string_literal: true

module Mutations
  class Cars::CarUpdate < BaseMutation
    description "Updates a car by id"

    field :car, Types::CarType, null: false

    argument :id, ID, required: true
    argument :car_input, Types::Inputs::CarInputType, required: true

    def resolve(id:, car_input:)
      car = ::Car.find(id)
      raise GraphQL::ExecutionError.new "Error updating car", extensions: car.errors.to_hash unless car.update(**car_input)

      { car: car }
    end
  end
end
