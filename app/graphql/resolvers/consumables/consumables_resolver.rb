
module Resolvers
  module Consumables
    class ConsumablesResolver < BaseResolver
      description 'Returns all existence consumables or for specific car'

      type [Types::ConsumableType], null: false

      argument :car_id, ID, required: false

      def resolve(car_id: nil)
        return Car.find(car_id).consumables if car_id.present?
        return Consumable.all unless car_id.present?
      end
    end
  end
end