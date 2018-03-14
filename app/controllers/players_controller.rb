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

    user = User.find(params[:id])
    userid = user.id
    player = Player.find_by(user_id: userid)
    player = Player.create!({
      age: age
      zip_code: zip_code
      bio: bio
      user_id: userid
    })
  end

  def updatePlayer
    user = User.find(params[:id])
    userid = user.id
    player = Player.find_by(user_id: userid)
    player.update!(player_params)
    render json: user
  end

  private 
    def player_params
      params.require(:player).permit(:zip_code, :age, :bio)
    end

end
