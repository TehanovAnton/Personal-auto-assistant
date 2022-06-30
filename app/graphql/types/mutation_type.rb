# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :user_delete, mutation: Mutations::Users::UserDelete
    field :user_create, mutation: Mutations::Users::UserCreate
  end
end
