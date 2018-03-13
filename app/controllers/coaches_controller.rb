class CoachesController < ApplicationController
  def show
    coach = Coach.find(params[:id])
    render json: coach
  end

  def index
    coaches = Coach.all
    render json: coaches
  end


end
