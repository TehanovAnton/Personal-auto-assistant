# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :part_delete, mutation: Mutations::Parts::PartDelete
    field :part_update, mutation: Mutations::Parts::PartUpdate
    field :part_create, mutation: Mutations::Parts::PartCreate

    field :service_delete, mutation: Mutations::Services::ServiceDelete
    field :service_update, mutation: Mutations::Services::ServiceUpdate
    field :service_create, mutation: Mutations::Services::ServiceCreate
    
    field :work_delete, mutation: Mutations::Works::WorkDelete
    field :work_update, mutation: Mutations::Works::WorkUpdate
    field :work_create, mutation: Mutations::Works::WorkCreate

    field :user_delete, mutation: Mutations::Users::UserDelete
    field :user_create, mutation: Mutations::Users::UserCreate
    field :user_update, mutation: Mutations::Users::UserUpdate
  end
end
