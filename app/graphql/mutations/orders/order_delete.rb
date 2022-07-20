# frozen_string_literal: true

module Mutations
  module Orders
    class OrderDelete < BaseMutation
      description 'Deletes a order by ID'

      field :order, Types::OrderType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        order = ::Order.find(id)
        unless order.destroy
          raise GraphQL::ExecutionError.new 'Error deleting order',
                                            extensions: order.errors.to_hash
        end

        { order: order }
      end
    end
  end
end
