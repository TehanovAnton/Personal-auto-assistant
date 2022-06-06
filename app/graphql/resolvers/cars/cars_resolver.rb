# frozen_string_literal: true

module Resolvers
  module Cars
    class CarsResolver < Resolvers::BaseResolver
      description 'all cars'

      type [Types::CarType], null: false

      def resolve
        Car.all
      end
    end
  end
end
