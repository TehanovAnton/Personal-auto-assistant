# frozen_string_literal: true

module Types
  module Inputs
    class ConsumableInputType < Types::BaseInputObject
      argument :id, ID, required: false
      argument :car_id, Integer, required: false
      argument :consumable_category_id, Integer, required: false
      argument :value, Integer, required: false
      argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
    end
  end
end
