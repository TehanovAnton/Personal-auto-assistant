# frozen_string_literal: true

module Mutations
  module Comments
    class CommentCreate < BaseMutation
      description 'Creates a new comment'

      field :comment, Types::CommentType, null: false

      argument :comment_input, Types::Inputs::CommentInputType, required: true

      def resolve(comment_input:)
        comment = ::Comment.new(**comment_input)
        unless comment.save
          raise GraphQL::ExecutionError.new 'Error creating comment',
                                            extensions: comment.errors.to_hash
        end

        { comment: comment }
      end
    end
  end
end
