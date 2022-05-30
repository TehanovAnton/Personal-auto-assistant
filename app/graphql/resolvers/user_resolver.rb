# frozen_string_literal: true

module Resolvers
  class UserResolver < Resolvers::BaseResolver
    description 'user by id'

    type Types::UserType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      User.find(id)
    end
  end
end
