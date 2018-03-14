class CoachesController < ApplicationController
  def show
    coach = Coach.find(params[:id])
    render json: coach
  end

  def index
    coaches = Coach.all
    render json: coaches
  end

  def createCoach
    price = params[:price]
    zip_code = params[:zip_code]
    bio = params[:bio]
    image = params[:image]
    user_id = params[:user_id]

    # user = User.find(params[:id])
    # userid = user.id
    # player = Player.find_by(user_id: userid)
    caoch = Coach.create!({
      price: price,
      zip_code: zip_code,
      bio: bio,
      image: image,
      user_id: user_id
    })

    if coach
      render json: coach
    else
      render json: {err: 'Sorry there was an error'}
    end

  end

  def updateCoach
    user = User.find(params[:id])
    userid = user.id
    coach = Coach.find_by(user_id: userid)
    coach.update!(coach_params)
    render json: user
  end

  private 
    def coach_params
      params.require(:coach).permit(:price, :zip_code, :bio, :image)
    end

end
