class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to new_user_url
    else
      flash[:danger] = "Username or password incorrect"
      redirect_to login_url
    end

  end


end
