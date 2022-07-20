# frozen_string_literal: true

module Mutations
  module Users
    class UserCreate < BaseMutation
      description 'Creates a new user'

      field :user, Types::UserType, null: false

      argument :user_input, Types::Inputs::UserInputType, required: true

      def resolve(user_input:)
        user = User.new(**user_input)
        unless user.save
          raise GraphQL::ExecutionError.new 'Error creating user',
                                            extensions: user.errors.to_hash
        end

        { user: user }
      end
    end
  end
end
