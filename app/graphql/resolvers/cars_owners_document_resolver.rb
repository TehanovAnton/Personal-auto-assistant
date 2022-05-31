# frozen_string_literal: true

module Resolvers
  class CarsOwnersDocumentResolver < Resolvers::BaseResolver
    description 'document'

    type Types::CarsOwnersDocumentType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      CarsOwnersDocument.find(id)
    end
  end
end
