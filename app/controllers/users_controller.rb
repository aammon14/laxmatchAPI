class UsersController < ApplicationController

  def index
    puts 'called'
    session[:session_token] = 3
    render json: [1, 2, 3, 4]
  end

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end


  def new
    @user = User.new
  end

  def create
    user = User.create!(user_params)

    if user
      render json: {token: gen_token(user.id)}
    else
      render json: {err: 'Sorry there was an error'}
    end
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: user
  end

  def gen_token(user_id)
    payload = {id: user_id}
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def is_logged_in
    if current_user
      render json: current_user
    else render nothing: true, status: 401
    end
  end

  def login
    email = params[:email]
    password = params[:password]

    user = User.find_from_credentials email, password
    if user.nil?
      render json: { err: 'No user' }
    else
      render json: { user: user, token: gen_token(user.id)}
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    render plain: 'user has been deleted'
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :role, :password)
    end

end
