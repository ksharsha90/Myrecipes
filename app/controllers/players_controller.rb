class PlayersController < ApplicationController 
before_action :set_player, only: [:edit, :update, :show]

  def new
    @player = Player.new
  end
  
  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:success] = "Player is successfully added"
      redirect_to player_path(@player)
    else
      render 'new'
    end
  end
  
  def index
    @players = Player.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @player_teams = @player.teams.paginate(page: params[:page], per_page: 5)
  end
  
  def edit
    
  end
  
  def update
    if @player.update(player_params)
      flash[:success] = "Player name was succesfullt updated"
      redirect_to @player
    else
      render 'edit'
    end
  end
  
  private
  
  
  def player_params
    params.require(:player).permit(:name)
  end
  
  def set_player
    @player = Player.find(params[:id])
  end

end