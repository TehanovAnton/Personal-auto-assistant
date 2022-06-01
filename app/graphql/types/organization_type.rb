# frozen_string_literal: true

module Types
  class OrganizationType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :phone_number, String, null: false
    field :address, String, null: false
    field :name, String, null: false
    field :service_owner_id, Integer, null: false
  end
end
