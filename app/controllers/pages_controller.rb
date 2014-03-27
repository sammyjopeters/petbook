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
    puts "Hokay, so these are the people I'm following"
    followlist.each {|person| puts person.first_name}

    #then start by getting my stuff only first.

    if followlist.nil?
      puts "***** I am not following anybody. Returning my own stuff."
      # if you aren't following anybody, just return your stuff.
      @everything = show_my_stuff(@user)
      puts "this should show all my own stuff. #{@everything.inspect}"
      render alert: "You're not following anybody at the moment!"
      puts @everything.inspect
    else
      puts "***** I have followers! I'm printing everything I've got."
      @everything = show_me_all_things(followlist)
    end
    puts "This is what I'm gonna try and print in the view!!!!!!!! \n"
    puts @everything.inspect
    puts "\n"

  end


  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.fetch(:post, {}).permit(:user_id, :content, :date_created, :comments_id)
  end

  def comment_params
    params.fetch(:comment, {}).permit(:user_id, :content, :created_date, :post_id)
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
        puts "showing you the posts I got for #{user.first_name}: \n #{@posts.inspect}"
        puts "\n"
      else
      end

      #only do this if you've got snapshots
      if user.snapshots.present?
        puts "got snapshots! printing."
        user_photos = user.snapshots.order(created_at: :desc).limit(10) if user.snapshots.present?
        @snapshots += user_photos
        puts "showing you the snapshots I got for #{user.first_name}: \n #{@snapshots.inspect}"
        puts "\n"
      else
        puts "no snapshots. Boo!"
      end

      puts "I'm going to chuck this back out to the controller: \n"
      puts @everything.inspect
      puts "\n"
      @everything = (@posts + @snapshots).sort_by(&:created_at).reverse!
    end
    @everything

  end #end def show me all things

end