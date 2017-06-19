Rails.application.routes.draw do
  resources :ideas
  resources :conversations
  root 'ideas#index'
  get 'auth/facebook', as: "login"
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout'   => 'sessions#destroy', as: "logout"

  post 'tokens' => 'tokens#create'
  post 'message' => 'message#create'
end
