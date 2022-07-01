# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :work_update, mutation: Mutations::Works::WorkUpdate
    field :work_create, mutation: Mutations::Works::WorkCreate

    field :user_delete, mutation: Mutations::Users::UserDelete
    field :user_create, mutation: Mutations::Users::UserCreate
    field :user_update, mutation: Mutations::Users::UserUpdate
  end
end
