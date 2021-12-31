class Comment < ApplicationRecord
  has_many :subcomments, class_name: 'Comment',
                         foreign_key: 'comment_id',
                         dependent: :destroy

  belongs_to :comment, class_name: 'Comment', optional: true
end
