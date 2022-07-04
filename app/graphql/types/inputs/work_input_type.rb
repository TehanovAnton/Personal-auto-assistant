# frozen_string_literal: true

module Types  
  class Inputs::WorkInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :title, String, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :category_id, Integer, required: false
  end
end
