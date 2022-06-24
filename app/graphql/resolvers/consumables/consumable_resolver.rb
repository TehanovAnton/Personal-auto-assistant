# frozen_string_literal: true

module Resolvers
  module Consumables
    class ConsumableResolver < BaseResolver
      description 'Returns consumable for specific car by consumable name'

      type Types::ConsumableType, null: false

      argument :car_id, ID, required: true
      argument :consumable_category_id, Integer, required: true

      def resolve(car_id:, consumable_category_id:)
        Car.find(car_id).consumables.find do |c|
          c.consumable_category_id == consumable_category_id
        end
      end
    end
  end
end
