# frozen_string_literal: true

module Types
  class CarType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer
    field :model, String, null: false
    field :year_production, Integer, null: false
    field :engine_volume, Integer, null: false
    field :mileage, Integer, null: false
    field :body_type, String, null: false
    field :maker, String, null: false
    field :vin, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :fuel_type, Integer, null: false
    field :transmission_type, Integer, null: false
  end
end
