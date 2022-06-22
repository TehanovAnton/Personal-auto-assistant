# frozen_string_literal: true

module Types
  class ConsumableType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :car, Types::CarType, null: false
    field :value, Integer, null: false
  end
end
