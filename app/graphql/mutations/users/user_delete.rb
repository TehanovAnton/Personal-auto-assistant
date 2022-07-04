# frozen_string_literal: true

module Mutations
  module Users
    class UserDelete < BaseMutation
      description 'Deletes a user by ID'

      field :user, Types::UserType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        user = ::User.find(id)
        unless user.destroy
          raise GraphQL::ExecutionError.new 'Error deleting user',
                                            extensions: user.errors.to_hash
        end

        { user: user }
      end
    end
  end
end
