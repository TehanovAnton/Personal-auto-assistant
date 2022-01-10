# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    redirect_back(fallback_location: root_path) if current_user.comments.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end
end
