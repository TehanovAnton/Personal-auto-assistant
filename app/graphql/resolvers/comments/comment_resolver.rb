# frozen_string_literal: true

module Resolvers
  module Comments
    class CommentResolver < Resolvers::BaseResolver
      description 'Order comment by id'

      type Types::CommentType, null: false

      argument :orderId, ID, required: true
      argument :commentId, ID, required: true

      def resolve(orderId:, commentId:)
        order = Order.find_by(id: orderId)

        if order.present?
          return order.comments.find_by(id: commentId)
        end

        nil
      end
    end
  end
end
 