class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    rowdie = Rowdie.find_by(email: params[:session][:email].downcase)
    if rowdie && rowdie.authenticate(params[:session][:password])
      session[:rowdie_id] = rowdie.id
      flash[:success] = "You have succesfully logged in"
      redirect_to rowdie
    else
      flash.now[:danger] = "There was something wrong about your information"
      render 'new'
    end
  end
  
  def destroy
    session[:rowdie_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
end