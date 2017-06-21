Rails.application.routes.draw do

  resources :ideas do
    resources :conversations, only: [:index, :show, :new, :create]
    resources :upvotes, only: [:create]
  end
  resources :conversations, only: [:update]
  resources :favorite_ideas, only: [:create, :destroy]

  root 'ideas#index'



  get 'auth/facebook', as: "login"
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout'   => 'sessions#destroy', as: "logout"

  get 'userprofile' => 'users#show'
  post 'userprofile' => 'users#update'

  get 'upvotesort' => 'ideas#upvotesort'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'tokens' => 'tokens#create'
  # post '/ideas/conversations' => 'conversations#create'

end
