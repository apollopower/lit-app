Rails.application.routes.draw do
<<<<<<< HEAD

  resources :ideas do
  resources :upvotes, only: :create
  end

resources :favorite_ideas, only: [:create, :destroy]

  root 'ideas#index'

  get 'auth/facebook', as: "login"
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout'  => 'sessions#destroy', as: "logout"

  get 'upvotesort' => 'ideas#upvotesort'
=======
  resources :ideas do
    resources :conversations, only: [:index, :show, :new, :create]
  end
  resources :conversations, only: [:update]

  root 'ideas#index'



  get 'auth/facebook', as: "login"
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout'   => 'sessions#destroy', as: "logout"

  get 'userprofile' => 'users#show'
  post 'userprofile' => 'users#update'
>>>>>>> master

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'tokens' => 'tokens#create'
  # post '/ideas/conversations' => 'conversations#create'

end
