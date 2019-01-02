class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash[:notice] = "Username or password incorrect"
      redirect_to login_url
    end
  end

  def destroy
    log_out
    flash[:notice] = "Successfully logged out. Goodbye!"
    redirect_to login_url
  end


end
