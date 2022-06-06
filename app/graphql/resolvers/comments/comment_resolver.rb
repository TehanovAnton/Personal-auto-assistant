# frozen_string_literal: true

module Resolvers
  module Comments
    class CommentResolver < Resolvers::BaseResolver
      description 'Order comment by id'

      type Types::CommentType, null: false

      argument :order_id, ID, required: true
      argument :comment_id, ID, required: true

      def resolve(order_id:, comment_id:)
        order = Order.find_by(id: order_id)

        return order.comments.find_by(id: comment_id) if order.present?

        nil
      end
    end
  end
end
