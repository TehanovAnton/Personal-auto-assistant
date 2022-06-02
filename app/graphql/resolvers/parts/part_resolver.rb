# frozen_string_literal: true

module Resolvers
  module Parts
    class PartResolver < BaseResolver
      description 'Car part'

      type Types::PartType, null: true

      argument :car_id, ID, required: true
      argument :part_id, ID, required: false

      def resolve(car_id:, part_id:)
        Car.find(car_id).parts.find { |p| p.id == part_id.to_i }
      end
    end
  end
end
