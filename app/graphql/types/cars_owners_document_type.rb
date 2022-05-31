# frozen_string_literal: true

module Types
  class CarsOwnersDocumentType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: false
    field :document_id, Integer, null: false
    field :issue_date, GraphQL::Types::ISO8601Date, null: false
    field :term_of_validity, Integer, null: false
  end
end
