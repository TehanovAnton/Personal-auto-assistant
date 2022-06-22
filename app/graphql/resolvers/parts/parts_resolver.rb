# frozen_string_literal: true

module Resolvers
  module Parts
    class PartsResolver < BaseResolver
      description 'Car parts'

      type [Types::PartType], null: false

      argument :car_id, ID, required: false

      def resolve(car_id: nil)
        return Car.find(car_id).parts if car_id.present?
        return Part.all unless car_id.present?
      end
    end
  end
end
