class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  def authenticate_user!
   current_user.nil?
  end

 def current_user
  @current_user ||= User.find(session[:user_id])
 end

 def logged_in?
  current_user.nil?
 end
end
