class TeamsController < ApplicationController
  
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @teams = Team.paginate(page: params[:page], per_page: 5)
  end
  
  def show
   
  end
  
  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(team_params)
    @team.rowdie = current_rowdie
    if @team.save
      flash[:success] = "Team was created successfully!"
      redirect_to team_path(@team)
    else
      render 'new'
    end
  end
  
  def edit
   
  end
  
  def update
    
    if @team.update(team_params)
    flash[:success] = "Team was updated successfully!"
    redirect_to team_path(@team)
    else
      render 'edit'
    end
  end
  
  def destroy
    Team.find(params[:id]).destroy
    flash[:success] = "Your team was deleted successfully!"
    redirect_to teams_path
  end
  
  private 
  
  def set_team
    @team = Team.find(params[:id])
  end
  
  def team_params
    params.require(:team).permit(:name, :description)
  end
  
  def require_same_user
    if current_rowdie != @team.rowdie
      flash[:danger] = "You can only edit or delete your own team!"
      redirect_to teams_path
    end
  end
  
end