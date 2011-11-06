class AdminSessionsController < ApplicationController
  def new
    @admin_session = AdminSession.new
  end

  def create
    @admin_session = AdminSession.new(params[:admin_session])
    
    if @admin_session.save
      flash[:notice] ="You have successfully logged in."
      redirect_to posts_url
    else
      render :action => :new
    end
  
  end  
  
  def destroy
    current_admin_session && current_admin_session.destroy
    flash[:notice]  = "You are now logged out." 
    redirect_to posts_url
  end  
     
end
