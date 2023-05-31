class HomeController < ApplicationController
  def index 
    @users = User.all
  end

  def render_user_data
    @user = User.find(params[:user_id])
  end
end
