Rails.application.routes.draw do
  
  resources :users do
    resources :coaches
    resources :players
  end

  get 'isLoggedIn', :to => 'users#is_logged_in'
  post 'users/login', :to => 'users#login'
  get 'users/:id/coach', :to => 'users#showCoach'
  get 'users/:id/player', :to => 'users#showPlayer'
end
