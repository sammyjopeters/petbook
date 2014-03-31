class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(:user_id => current_user.id)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to :back, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to :back, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        if params[:newsfeed]
          format.html {render action: 'newsfeed'}
        else
          format.html { render action: 'edit' }
        end
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  def addlike
    thepost = Post.find(params[:post_id])
    @like = thepost.likes.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_to :back
  end

  def unlike
    thepost = Post.find(params[:post_id])
    @like = thepost.likes.find_by(user_id: current_user.id)
    @like.destroy
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :content, :comments_id, :tag_list)
    end

    def like_params
      params.require(:like).permit(:user_id, :post_id)
    end
end
