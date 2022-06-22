# frozen_string_literal: true

module Resolvers
  module Comments
    class CommentsResolver < Resolvers::BaseResolver
      description 'Order comments'

      type [Types::CommentType], null: true

      argument :order_id, ID, required: true

      def resolve(order_id:)
        order = Order.find_by(id: order_id)

        return order.comments if order.present?

        nil
      end
    end
  end
end
