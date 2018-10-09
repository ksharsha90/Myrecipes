class TeamsController < ApplicationController
  
  def index
    @teams = Team.all
  end
  
  def show
    @team = Team.find(params[:id])
  end
  
  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(team_params)
    @team.rowdie = Rowdie.first
    if @team.save
      flash[:success] = "Team was created successfully!"
      redirect_to team_path(@team)
    else
      render 'new'
    end
  end
  
  def edit
    @team = Team.find(params[:id])
  end
  
  def update
    @team = Team.find(params[:id])
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
  
  def team_params
    params.require(:team).permit(:name, :description)
  end
  
end