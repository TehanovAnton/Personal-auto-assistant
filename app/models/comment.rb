# frozen_string_literal: true

class Comment < ApplicationRecord
  has_many :subcomments, class_name: 'Comment',
                         dependent: :destroy

  belongs_to :comment, class_name: 'Comment', optional: true
end
