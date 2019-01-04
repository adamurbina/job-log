class JobsController < ApplicationController
  #need something to stop unauthorized users from access

  def index
    @jobs = Job.all
    @user = current_user
  end

  def show
    @job = Job.find_by(id: params[:id])
    @user = current_user
  end

  def new
    @user = current_user
    @job = Job.new
  end

  def create
      raise params.inspect
  end

  private

  def job_params
    ## TODO:
  end

end
