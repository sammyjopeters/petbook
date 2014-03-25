class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def home
    render :layout => 'home'
  end

  def newsfeed
    @user = User.find(params[:user])

    #### Post form on page
    @post = Post.new(post_params)
    @posts = Post.all


    #the comments field doesn't work yet :(
    #@comment = Comment.new(comment_params)
    #@commentpost = Post.find(params[:id])
    #@comments = @commentpost.comments.build
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.fetch(:post, {}).permit(:user_id, :content, :date_created, :comments_id)
  end

  def comment_params
    params.fetch(:comment, {}).permit(:user_id, :content, :created_date, :post_id)
  end
end