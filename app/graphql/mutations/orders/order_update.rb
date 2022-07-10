# frozen_string_literal: true

module Mutations
  module Orders
    class OrderUpdate < BaseMutation
      description 'Updates a order by id'

      field :order, Types::OrderType, null: false

      argument :id, ID, required: true
      argument :order_input, Types::Inputs::OrderInputType, required: true

      def resolve(id:, order_input:)
        order = ::Order.find(id)
        unless order.update(**order_input)
          raise GraphQL::ExecutionError.new 'Error updating order',
                                            extensions: order.errors.to_hash
        end

        { order: order }
      end
    end
  end
end
