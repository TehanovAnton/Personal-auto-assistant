# frozen_string_literal: true

module Types
  class UserQueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    include Resolvers::UserResolvers

    field :users, [Types::UserType], null: false, description: 'all users' do
    end

    field :user, Types::UserType, null: false, description: 'user by id' do
      argument :id, ID
    end
  end
end
