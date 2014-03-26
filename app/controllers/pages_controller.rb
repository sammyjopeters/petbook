class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def home
    render :layout => 'home'
  end

  def newsfeed
    @user = User.find(params[:user])

    #### Post form on page
    @post = Post.new(post_params)

    ## determine the posts and pics you're going to read
    followlist = @user.following || []
    followlist = followlist.map {|x| User.find(x) }
    @posts = @user.posts if @user.posts.present?
    @snapshots = @user.snapshots if @user.snapshots.present?
    if followlist.nil?
      @everything = (@posts + @snapshots).sort_by(&:created_at).reverse!
      render alert: "You're not following anybody at the moment!"
    else
      followlist.each do |user|
        userposts = user.posts.order(created_at: :desc).limit(10) if user.posts
        userphotos = user.snapshots.order(created_at: :desc).limit(10) if user.snapshots
        @posts += userposts
        @snapshots += userphotos
      end
      @everything = (@posts + @snapshots).sort_by(&:created_at).reverse!
      puts "Gimme everyting: #{@everything.inspect}"
      puts "Now gimme the class names of everything!"
      @everything.each {|thing| puts thing.class.name}
    end


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