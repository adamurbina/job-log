class JobsController < ApplicationController

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
      @job = Job.make_job(params["job"], current_user)
      redirect_to job_url(@job)
  end

  private

  def job_params
    params.require(:job).permit(:property_name, :property_type, :fee, :client_company, client_attributes:[:company, :contact])
  end

end
