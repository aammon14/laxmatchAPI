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

  def showCoach
    user = User.find(params[:id])
    userid = user.id
    coach = Coach.find_by(user_id: userid)
    render json: coach
  end

  def showPlayer
    user = User.find(params[:id])
    userid = user.id
    @player = Player.find_by(user_id: userid)
    render json: @player
  end

  def new
    @user = User.new
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    role = params[:role]

    new_user = User.create!({
      name: name,
      email: email,
      password: password,
      role: role
    })

    user = User.find_from_credentials email, password
    if new_user
      render json: {user: user, token: gen_token(user.id)}
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
      params.require(:user).permit(:name, :email, :password, :role)
    end

end
