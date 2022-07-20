# frozen_string_literal: true

module Types
  module Inputs
    class OrganizationInputType < Types::BaseInputObject
      argument :id, ID, required: false
      argument :email, String, required: false
      argument :phone_number, String, required: false
      argument :address, String, required: false
      argument :name, String, required: false
      argument :service_owner_id, Integer, required: false
      argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
    end
  end
end
