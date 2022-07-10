# frozen_string_literal: true

module Mutations
  module Orders
    class OrderCreate < BaseMutation
      description 'Creates a new order'

      field :order, Types::OrderType, null: false

      argument :order_input, Types::Inputs::OrderInputType, required: true

      def resolve(order_input:)
        order = ::Order.new(**order_input)
        unless order.save
          raise GraphQL::ExecutionError.new 'Error creating order',
                                            extensions: order.errors.to_hash
        end

        { order: order }
      end
    end
  end
end
