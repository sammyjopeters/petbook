class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.create(comment_params)

    redirect_to :back
  end



  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end