class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  
  private

  def require_login
  	session[:redirect_uri] = request.original_url
  	redirect_to login_path unless current_user
  end

  def current_user
  	@current_user ||= User.find_by_id(session[:user_id])
  end

end
