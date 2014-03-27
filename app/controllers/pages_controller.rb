class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def home
    render :layout => 'home'
  end

  def newsfeed
    @user = User.find(params[:user])

    #### Post form on page
    @post = Post.new(post_params)

    #initialize posts and snapshots and everything variables
    @posts = []
    @snapshots = []
    @everything = []


    ## first, grab all the users you're following
    followlist = @user.following || []
    followlist = followlist.map {|x| User.find(x) }
    followlist.each {|person| puts person.first_name}

    #then start by getting my stuff only first.

    if followlist.nil?
      # if you aren't following anybody, just return your stuff.
      @everything = show_my_stuff(@user)
      render alert: "You're not following anybody at the moment!"
      puts @everything.inspect
    else
      @everything = show_me_all_things(followlist)
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

  def like_params
    params.fetch(:like, {}).permit(:user_id, :snapshot_id, :post_id)
  end

  def show_my_stuff(user)
    @posts = user.posts if user.posts.present?
    @snapshots = user.snapshots if user.snapshots.present?
    @everything = (@posts + @snapshots).sort_by(&:created_at).reverse!
  end # end def show my stuff

  def show_me_all_things(followlist)
    ([@user] + followlist).each do |user|
      # only do this if you've got posts
      if user.posts.present?
        user_posts = user.posts.order(created_at: :desc).limit(10)
        @posts += user_posts
      else
      end

      #only do this if you've got snapshots
      if user.snapshots.present?
        user_photos = user.snapshots.order(created_at: :desc).limit(10) if user.snapshots.present?
        @snapshots += user_photos
      else
      end
      @everything = (@posts + @snapshots).sort_by(&:created_at).reverse!
    end
    @everything

  end #end def show me all things

end