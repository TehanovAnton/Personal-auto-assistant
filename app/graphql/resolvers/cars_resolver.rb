
module Resolvers
  class CarsResolver < Resolvers::BaseResolver
    description 'all cars'

    type [Types::CarType], null: false

    def resolve
      Car.all
    end
  end
end
