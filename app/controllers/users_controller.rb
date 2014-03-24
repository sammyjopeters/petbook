class UsersController < ApplicationController

  def index
  @users = User.all
  end

  def profile
    @user = User.find(params[:user])
  end


end
