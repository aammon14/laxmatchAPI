class PlayersController < ApplicationController
  def show
    player = Player.find(params[:user_id])
    render json: player
  end

  def index
    players = Player.all
    render json: players
  end

end
