Rails.application.routes.draw do
  
  resources :users do
    resources :coaches
    resources :players
  end

  resources :messages

  get 'isLoggedIn', :to => 'users#is_logged_in'
  post 'users/login', :to => 'users#login'
  get 'users/:id/coach', :to => 'users#showCoach'
  get 'users/:id/player', :to => 'users#showPlayer'
  put 'users/:id/player', :to => 'players#updatePlayer'
  post 'users/:id/player', :to => 'players#createPlayer'
  put 'users/:id/coach', :to => 'coaches#updateCoach'
  post 'users/:id/coach', :to => 'coaches#createCoach'
end
