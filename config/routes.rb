Rails.application.routes.draw do
  resources :users do
    resources :coaches
  end

  get 'isLoggedIn', :to => 'users#is_logged_in'
  post 'users/login', :to => 'users#login'
  
end
