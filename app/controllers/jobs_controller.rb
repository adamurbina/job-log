class JobsController < ApplicationController

  def index
    @jobs = Job.all
    @user = current_user
  end

  def show
    @job = Job.find_by(id: params[:id])
    @user = current_user
  end

end
