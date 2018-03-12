class CoachesController < ApplicationController
  def show
    coach = Coach.find(params[:user_id])
    render json: coach
  end

  def index
    coaches = Coach.all
    render json: coaches
  end


end
