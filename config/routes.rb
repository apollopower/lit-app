Rails.application.routes.draw do
  resources :ideas do
    post 'conversations' => 'conversations#create'
  end
  # post 'conversations' => 'conversations#create'
  root 'ideas#index'



  get 'auth/facebook', as: "login"
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout'   => 'sessions#destroy', as: "logout"

  get 'userprofile' => 'users#show'
  post 'userprofile' => 'users#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'tokens' => 'tokens#create'
  # post '/ideas/conversations' => 'conversations#create'

end
