class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_admin_session, :current_admin
  
  private 
  
  def current_admin_session
    return @current_admin_session if defined?(@current_admin_session)
    @current_admin_session = AdminSession.find
  end
  
  def current_admin
    return @current_admin if defined?(@current_admin)
    @current_admin = current_admin_session && current_admin_session.admin
  end   
  
  def require_current_admin
    unless current_admin
     flash[:error] = 'You must be logged in.' 
      redirect_to root_path
    end  
  end  
end
