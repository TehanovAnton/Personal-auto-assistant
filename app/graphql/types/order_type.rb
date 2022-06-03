# frozen_string_literal: true

module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :car, Types::CarType, null: false
    field :service, Types::ServiceType, null: false
    field :work, Types::WorkType, null: false
  end
end
