# frozen_string_literal: true

module Mutations
  module Comments
    class CommentUpdate < BaseMutation
      description 'Updates a comment by id'

      field :comment, Types::CommentType, null: false

      argument :id, ID, required: true
      argument :comment_input, Types::Inputs::CommentInputType, required: true

      def resolve(id:, comment_input:)
        comment = ::Comment.find(id)
        unless comment.update(**comment_input)
          raise GraphQL::ExecutionError.new 'Error updating comment',
                                            extensions: comment.errors.to_hash
        end

        { comment: comment }
      end
    end
  end
end
