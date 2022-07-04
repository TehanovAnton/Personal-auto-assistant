# frozen_string_literal: true

module Mutations
  module Users
    class UserUpdate < BaseMutation
      description 'Updates a user by id'

      field :user, Types::UserType, null: false

      argument :id, ID, required: true
      argument :user_input, Types::Inputs::UserInputType, required: true

      def resolve(id:, user_input:)
        user = ::User.find(id)
        unless user.update(**user_input)
          raise GraphQL::ExecutionError.new 'Error updating user',
                                            extensions: user.errors.to_hash
        end

        { user: user }
      end
    end
  end
end
