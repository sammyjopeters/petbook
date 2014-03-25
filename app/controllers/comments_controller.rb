class PagesController < ApplicationController

  def create
    @comment = Comment.new(post_params)

  end



  private

  def comment_params
    params.require(:comment).permit(:user_id, :content, :created_date, :post_id)
  end
end