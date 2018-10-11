class RowdiesController < ApplicationController
  
  def new
    @rowdie = Rowdie.new
  end
  
  def create
    @rowdie = Rowdie.new(rowdie_params)
    if @rowdie.save
      flash[:success] = "Welcome #{@rowdie.rowdyname} to FootballManiacs App!"
      redirect_to rowdy_path(@rowdie)
    else
      render 'new'
    end
  end
  
  def show
    
  end
  
  
  private
  
  def rowdie_params
    params.require(:rowdie).permit(:rowdyname, :email, :password, :password_confirmation)
  end
  
end