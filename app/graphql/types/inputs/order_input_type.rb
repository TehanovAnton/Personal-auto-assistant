# frozen_string_literal: true

module Types
  module Inputs
    class OrderInputType < Types::BaseInputObject
      argument :id, ID, required: false
      argument :car_id, Integer, required: false
      argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :services_work_id, Integer, required: false
      argument :mileage, Integer, required: false
    end
  end
end
