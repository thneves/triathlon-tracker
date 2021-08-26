class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :set_current_user

  private

  def set_current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
