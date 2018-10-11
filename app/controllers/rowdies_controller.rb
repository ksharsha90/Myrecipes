class RowdiesController < ApplicationController
  
  before_action :set_rowdie, only: [:show, :edit, :destroy, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  
  def index
    @rowdies = Rowdie.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @rowdie = Rowdie.new
  end
  
  def create
    @rowdie = Rowdie.new(rowdie_params)
    if @rowdie.save
      session[:rowdie_id] = @rowdie.id
      flash[:success] = "Welcome #{@rowdie.rowdyname} to FootballManiacs App!"
      redirect_to rowdy_path(@rowdie)
    else
      render 'new'
    end
  end
  
  def show
    
    @rowdie_teams = @rowdie.teams.paginate(page: params[:page], per_page: 5)
  end
  
  def edit
   
  end
  
  def update
   
    if @rowdie.update(rowdie_params)
      flash[:success] = "Your account has updated succesfully!"
      redirect_to @rowdie
    else
      render 'edit'
    end
  end
  
  def destroy
    if !@rowde.admin?
    @rowdie.destroy
    flash[:danger] = "Rowdie and all associated teams have been deleted"
    redirect_to rowdies_path
    end
  end
  
  
  private
  
  def set_rowdie
    @rowdie = Rowdie.find(params[:id])
  end
  
  def rowdie_params
    params.require(:rowdie).permit(:rowdyname, :email, :password, :password_confirmation)
  end
  
  def require_same_user
    if current_rowdie != @rowdie and !current_rowdie.admin?
      flash[:danger] = "You can only delete or edit your account"
      redirect_to rowdy_path
    end
  end
  
  def require_admin
    if logged_in? && !current_rowdie.admin?
      flash[:danger] = "only admin users can perform that action!"
      redirect_to root_path
    end
  end
  
end