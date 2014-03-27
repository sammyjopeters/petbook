class SnapshotsController < ApplicationController
  before_action :set_snapshot, only: [:show, :edit, :update, :destroy]

  # GET /snapshots
  # GET /snapshots.json
  def index
    #raise params.inspect
    @snapshots = Snapshot.all
    @user = User.find(params[:user_id])

    @snapshots = @user.snapshots
    if @user == current_user
      @title = "My Photos"
    else
      @title = "#{@user.first_name}'s Photos"
    end
  end

  # GET /snapshots/1
  # GET /snapshots/1.json
  def show

  end

  # GET /snapshots/new
  def new
    @snapshot = Snapshot.new
    # generate a unique id for the upload
  end

  # GET /snapshots/1/edit
  def edit
  end

  # POST /snapshots
  # POST /snapshots.json
  def create
    @snapshot = Snapshot.new(snapshot_params)

    respond_to do |format|
      if @snapshot.save
        format.html { redirect_to @snapshot, notice: 'Snapshot was successfully created.' }
        format.json { render action: 'show', status: :created, location: @snapshot }
      else
        format.html { render action: 'new' }
        format.json { render json: @snapshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snapshots/1
  # PATCH/PUT /snapshots/1.json
  def update
    respond_to do |format|
      if @snapshot.update(snapshot_params)
        format.html { redirect_to @snapshot, notice: 'Snapshot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @snapshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snapshots/1
  # DELETE /snapshots/1.json
  def destroy
    @snapshot.destroy
    respond_to do |format|
      format.html { redirect_to snapshots_url }
      format.json { head :no_content }
    end
  end


  def addlike
    snapshot = Snapshot.find(params[:id])
    @like = snapshot.likes.create(like_params)
    redirect_to :back

    #post.increment!(:likes, by = 1)
    #redirect_to newsfeed_path(current_user, :anchor => snapshot.id)
  end

  def tag_list
    self.tags.map(&:name).join(', ')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snapshot
      @snapshot = Snapshot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snapshot_params
      params.require(:snapshot).permit(:user_id, :image, :comments_id, :tag_list)
    end
end
