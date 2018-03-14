class PlayersController < ApplicationController
  def show
    player = Player.find(params[:id])
    render json: player
  end

  def index
    players = Player.all
    render json: players
  end

  def createPlayer
    age = params[:age]
    zip_code = params[:zip_code]
    bio = params[:bio]
    user_id = params[:user_id]

    # user = User.find(params[:id])
    # userid = user.id
    # player = Player.find_by(user_id: userid)
    player = Player.create!({
      age: age,
      zip_code: zip_code,
      bio: bio,
      user_id: user_id
    })

    if player
      render json: player
    else
      render json: {err: 'Sorry there was an error'}
    end

  end

  def updatePlayer
    user = User.find(params[:id])
    userid = user.id
    player = Player.find_by(user_id: userid)
    player.update!(player_params)
    render json: {playerInfo: player}
  end

  private 
    def player_params
      params.require(:player).permit(:zip_code, :age, :bio)
    end

end
