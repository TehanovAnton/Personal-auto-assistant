# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :user, Types::UserType, null: false
    field :commentable_type, String, null: false
    field :commentable_id, ID, null: false
  end
end
