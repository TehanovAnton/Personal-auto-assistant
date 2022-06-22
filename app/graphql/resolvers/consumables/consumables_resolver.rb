# frozen_string_literal: true

module Resolvers
  module Consumables
    class ConsumablesResolver < BaseResolver
      description 'Returns car consumables'

      type [Types::ConsumableType], null: true

      argument :car_id, ID, required: true

      def resolve(car_id:)
        car = Car.find_by(id: car_id)

        return car.consumables if car.present?

        nil
      end
    end
  end
end
