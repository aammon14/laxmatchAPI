class MessagesController < ApplicationController

  def index
    messages = Message.all
    render json: messages
  end

  def show
    message = Message.find(params[:id])
    render json: message
  end

  def create
    player_id = params[:player_id]
    coach_id = params[:coach_id]
    body = params[:body]

    message = Message.create!({
      player_id: player_id,
      coach_id: coach_id,
      body: body
    })

    if message
      render json: message
    else
      render json: {err: 'Sorry there was an error'}
    end
  end

end

