class UsersController < ApplicationController
  #before_action :require_login

  def new
  end

  def show
      @user = User.find_by(id: params[:id])
  end

end
