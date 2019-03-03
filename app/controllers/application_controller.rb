class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !current_user
      flash[:negative] = 'You must be authentificated to perform that action'
      redirect_to login_path
    end
  end
  
  def logged_in_redirect
    if logged_in?
      flash[:negative] = 'You are arleady logged in'
      redirect_to root_path
    end
  end
end
