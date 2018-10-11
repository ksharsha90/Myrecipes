class ApplicationController < ActionController::Base
  
  helper_method :current_rowdie, :logged_in?
  
  def current_rowdie
    @current_rowdie ||= Rowdie.find(session[:rowdie_id]) if session[:rowdie_id]
  end
  
  def logged_in?
    !!current_rowdie
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
  
end
