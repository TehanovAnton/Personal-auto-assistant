# frozen_string_literal: true

module Types
  class ServiceType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :phone_number, String, null: false
    field :address, String, null: false
    field :organization, Types::OrganizationType, null: false
    field :works, [Types::WorkType], null: false
  end
end
