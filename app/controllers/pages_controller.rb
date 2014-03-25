class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def home
    render :layout => 'home'
  end

  def newsfeed
    @user = User.find(params[:user])
  end


end