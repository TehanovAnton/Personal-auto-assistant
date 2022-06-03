# frozen_string_literal: true

module Resolvers
  module Comments
    class CommentsResolver < Resolvers::BaseResolver
      description 'Order comments'

      type [Types::CommentType], null: true

      argument :orderId, ID, required: true

      def resolve(orderId:)
        order = Order.find_by(id: orderId)

        return order.comments if order.present?
        nil
      end
    end
  end
end
 