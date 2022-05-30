# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :users, resolver: Resolvers::UsersResolver

    field :user, resolver: Resolvers::UserResolver

    field :cars, resolver: Resolvers::CarsResolver
    
    field :car, resolver: Resolvers::CarsResolver
  end
end
