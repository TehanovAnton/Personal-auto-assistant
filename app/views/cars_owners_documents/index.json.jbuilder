# frozen_string_literal: true

json.array! @cars_owners_documents, partial: 'cars_owners_documents/cars_owners_document', as: :cars_owners_document
