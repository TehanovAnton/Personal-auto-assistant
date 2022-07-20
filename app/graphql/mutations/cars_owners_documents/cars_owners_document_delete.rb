# frozen_string_literal: true

module Mutations
  module CarsOwnersDocuments
    class CarsOwnersDocumentDelete < BaseMutation
      description 'Deletes a cars_owners_document by ID'

      field :cars_owners_document, Types::CarsOwnersDocumentType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        cars_owners_document = ::CarsOwnersDocument.find(id)
        unless cars_owners_document.destroy
          raise GraphQL::ExecutionError.new 'Error deleting cars_owners_document',
                                            extensions: cars_owners_document.errors.to_hash
        end

        { cars_owners_document: cars_owners_document }
      end
    end
  end
end
