# frozen_string_literal: true

module Types
  class Inputs::CarInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :user_id, Integer, required: false
    argument :model, String, required: false
    argument :year_production, Integer, required: false
    argument :engine_volume, Integer, required: false
    argument :mileage, Integer, required: false
    argument :body_type, String, required: false
    argument :maker, String, required: false
    argument :vin, String, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :fuel_type, Integer, required: false
    argument :transmission_type, Integer, required: false
  end
end
