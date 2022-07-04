# frozen_string_literal: true

module Types
  class Inputs::PartInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :name, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end
