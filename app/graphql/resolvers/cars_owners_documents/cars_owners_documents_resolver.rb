# frozen_string_literal: true

module Resolvers
  module CarsOwnersDocuments
    class CarsOwnersDocumentsResolver < Resolvers::BaseResolver
      description 'user documents'

      type [Types::CarsOwnersDocumentType], null: false

      argument :user_id, ID, required: false

      def resolve(user_id:)
        CarsOwnersDocument.where(user_id: user_id)
      end
    end
  end
end
