class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
      @user = User.find_by(id: params[:id])
      @clients = Client.where()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_url(@user)
    else
      flash[:notice] = "Unable to create user. Please try again."
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
