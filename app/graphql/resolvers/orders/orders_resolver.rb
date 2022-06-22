# frozen_string_literal: true

module Resolvers
  module Orders
    class OrdersResolver < Resolvers::BaseResolver
      description 'Car orders'

      type [Types::OrderType], null: false

      argument :car_id, ID, required: true

      def resolve(car_id:)
        car = Car.find_by(id: car_id)

        return car.orders if car.present?

        []
      end
    end
  end
end
