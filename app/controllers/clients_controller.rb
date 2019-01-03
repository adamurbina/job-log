class ClientsController < ApplicationController
  def show
    @client = Client.find_by(id: params[:id])
    @jobs = @client.jobs
  end
end
