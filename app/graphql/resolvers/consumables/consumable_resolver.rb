# frozen_string_literal: true

module Resolvers
  module Consumables
    class ConsumableResolver < BaseResolver
      description 'Returns consumable for specific car by consumable name'

      type Types::ConsumableType, null: false

      argument :car_id, ID, required: true
      argument :consumable_name, String, required: true

      def resolve(car_id:, consumable_name:)
        Car.find(car_id).consumables.find { |c| c.name == consumable_name }
      end
    end
  end
end
