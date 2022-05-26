# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  content          :string           not null
#  user_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  commentable_type :string
#
class Comment < ApplicationRecord
  paginates_per 5

  belongs_to :user
  belongs_to :commentable, polymorphic: true, optional: true
  has_many :comments, as: :commentable, dependent: :destroy
end
