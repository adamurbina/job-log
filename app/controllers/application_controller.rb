class ApplicationController < ActionController::Base
  include SessionsHelper
  include JobsHelper

  before_action :require_login

  private

  def require_login
    if !session.include? :user_id
      flash[:notice] = "Oops! You have to be signed in to do that..."
      redirect_to login_url
    end
  end
end
