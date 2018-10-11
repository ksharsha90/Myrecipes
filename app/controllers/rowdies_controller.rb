class RowdiesController < ApplicationController
  
  def index
    @rowdies = Rowdie.paginate(page: params[:page], per_page: 5)
  end
  
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
    @rowdie = Rowdie.find(params[:id])
    @rowdie_teams = @rowdie.teams.paginate(page: params[:page], per_page: 5)
  end
  
  def edit
    @rowdie = Rowdie.find(params[:id])
  end
  
  def update
    @rowdie = Rowdie.find(params[:id])
    if @rowdie.update(rowdie_params)
      flash[:success] = "Your account has updated succesfully!"
      redirect_to @rowdie
    else
      render 'edit'
    end
  end
  
  
  private
  
  def rowdie_params
    params.require(:rowdie).permit(:rowdyname, :email, :password, :password_confirmation)
  end
  
end