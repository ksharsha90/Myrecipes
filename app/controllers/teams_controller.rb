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
  
  private 
  
  def team_params
    params.require(:team).permit(:name, :description)
  end
  
end