# frozen_string_literal: true

module Types
  module Inputs
    class CommentInputType < Types::BaseInputObject
      argument :id, ID, required: false
      argument :content, String, required: false
      argument :user_id, Integer, required: false
      argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :commentable_id, Integer, required: false
      argument :commentable_type, String, required: false
    end
  end
end
