class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def home
    render :layout => 'home'
  end

  def newsfeed
    @user = User.find(params[:user])

    #### Post form on page
    @post = Post.new(post_params)

    ## determine the posts you're going to read
    followlist = @user.following || []
    followlist = followlist.map {|x| User.find(x) }
    puts "follow list should now be an array of users. Is it? #{followlist.inspect}"
    @posts = []
    followlist.each do |user|
      userposts = user.posts.order(created_at: :desc).limit(10)
      @posts += userposts
    end
    @posts.sort_by!{ |item| item.created_at }.reverse!

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