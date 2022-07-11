# frozen_string_literal: true

module Mutations
  module CarsOwnersDocuments
    class CarsOwnersDocumentUpdate < BaseMutation
      description 'Updates a cars_owners_document by id'

      field :cars_owners_document, Types::CarsOwnersDocumentType, null: false

      argument :id, ID, required: true
      argument :cars_owners_document_input, Types::Inputs::CarsOwnersDocumentInputType,
               required: true

      def resolve(id:, cars_owners_document_input:)
        cars_owners_document = ::CarsOwnersDocument.find(id)
        unless cars_owners_document.update(**cars_owners_document_input)
          raise GraphQL::ExecutionError.new 'Error updating cars_owners_document',
                                            extensions: cars_owners_document.errors.to_hash
        end

        { cars_owners_document: cars_owners_document }
      end
    end
  end
end
