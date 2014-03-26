class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def profile
    @user = User.find(params[:user])
  end

  def follow
    user = User.find(params[:id])
    currentuser = current_user
    currentuser.following = [] if currentuser.following.nil?
    currentuser.following << user.id
    currentuser.save
    puts "New following list is #{currentuser.following}"
    redirect_to user_profile_path(user)
  end

  def user_params
    params.require(:user).permit(:picture, :following)
  end
end
