# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :consumable_delete, mutation: Mutations::Consumables::ConsumableDelete
    field :consumable_update, mutation: Mutations::Consumables::ConsumableUpdate
    field :consumable_create, mutation: Mutations::Consumables::ConsumableCreate

    field :order_delete, mutation: Mutations::Orders::OrderDelete
    field :order_update, mutation: Mutations::Orders::OrderUpdate
    field :order_create, mutation: Mutations::Orders::OrderCreate

    field :organization_delete, mutation: Mutations::Organizations::OrganizationDelete
    field :organization_update, mutation: Mutations::Organizations::OrganizationUpdate
    field :organization_create, mutation: Mutations::Organizations::OrganizationCreate

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
