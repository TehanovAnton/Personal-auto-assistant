
module Resolvers
  class UsersResolver < Resolvers::BaseResolver
    description 'all users'

    type [Types::UserType], null: false

    def resolve
      User.all
    end
  end
end
