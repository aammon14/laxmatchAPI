class PlayersController < ApplicationController
  def show
    player = Player.find(params[:id])
    render json: player
  end

  def index
    players = Player.all
    render json: players
  end

  def update
    player = Player.find(params[:id])
    player.update!(player_params)
    render json: user
  end

  private 
    def user_params
      params.require(:player).permit(:zip_code, :age, :bio)
    end

end
