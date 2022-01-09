class CommentsController < ApplicationController
  def create
    if current_user.comments.create(comment_params)
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end
end
