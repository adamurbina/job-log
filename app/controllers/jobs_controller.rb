class JobsController < ApplicationController

  def index
    @jobs = Job.all
    @user = current_user
  end

end
