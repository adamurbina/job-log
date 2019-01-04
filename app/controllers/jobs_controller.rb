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
      @job = Job.make_job(params["job"])
      @job.user = current_user
      @job.save
      raise @job.inspect
  end

  private

  def job_params
    params.require(:job).permit(:property_name, :property_type, :fee, :client_company, client_attributes:[:company, :contact])
  end

end
