# frozen_string_literal: true

module Mutations
  class Cars::CarDelete < BaseMutation
    description "Deletes a car by ID"

    field :car, Types::CarType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      car = ::Car.find(id)
      raise GraphQL::ExecutionError.new "Error deleting car", extensions: car.errors.to_hash unless car.destroy

      { car: car }
    end
  end
end
