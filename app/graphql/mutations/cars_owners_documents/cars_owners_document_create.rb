# frozen_string_literal: true

module Mutations
  module CarsOwnersDocuments
    class CarsOwnersDocumentCreate < BaseMutation
      description 'Creates a new cars_owners_document'

      field :cars_owners_document, Types::CarsOwnersDocumentType, null: false

      argument :cars_owners_document_input, Types::Inputs::CarsOwnersDocumentInputType,
               required: true

      def resolve(cars_owners_document_input:)
        cars_owners_document = ::CarsOwnersDocument.new(**cars_owners_document_input)
        unless cars_owners_document.save
          raise GraphQL::ExecutionError.new 'Error creating cars_owners_document',
                                            extensions: cars_owners_document.errors.to_hash
        end

        { cars_owners_document: cars_owners_document }
      end
    end
  end
end
