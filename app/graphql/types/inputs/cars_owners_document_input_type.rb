# frozen_string_literal: true

module Types
  module Inputs
    class CarsOwnersDocumentInputType < Types::BaseInputObject
      argument :id, ID, required: false
      argument :user_id, Integer, required: false
      argument :document_id, Integer, required: false
      argument :issue_date, GraphQL::Types::ISO8601Date, required: false
      argument :term_of_validity, Integer, required: false
      argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
    end
  end
end
