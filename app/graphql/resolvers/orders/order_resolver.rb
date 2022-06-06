# frozen_string_literal: true

module Resolvers
  module Orders
    class OrderResolver < Resolvers::BaseResolver
      description 'Car order by id '

      type Types::OrderType, null: true

      argument :car_id, ID, required: true
      argument :order_id, ID, required: true

      def resolve(car_id:, order_id:)
        car = Car.find_by(id: car_id)

        if car.present?
          order = car.orders.find_by(id: order_id)
          return order if order.present?
        end

        nil
      end
    end
  end
end
