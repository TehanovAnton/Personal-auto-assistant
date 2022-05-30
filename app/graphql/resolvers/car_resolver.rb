
module Resolvers
  class CarResolver < Resolvers::BaseResolver
    description 'car by id'

    type Types::CarType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      Car.find(id)
    end
  end
end
