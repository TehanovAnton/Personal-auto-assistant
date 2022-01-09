# frozen_string_literal: true

class Comment < ApplicationRecord
  paginates_per 5

  belongs_to :user
  belongs_to :commentable, polymorphic: true, optional: true
  has_many :comments, as: :commentable, dependent: :destroy
end
