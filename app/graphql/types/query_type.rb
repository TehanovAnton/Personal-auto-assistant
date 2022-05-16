module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :user, Types::UserType, null: false, description: "user by id" do
      argument :id, ID
    end

    def user(id:)
      User.find(id)
    end
  end
end
