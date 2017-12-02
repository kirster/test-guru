class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless current_user
      cookies[:non_session_request] = request.url
      redirect_to login_path, alert: 'Verify your Email and Password'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
