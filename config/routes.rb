Rails.application.routes.draw do

  resources :ideas do
  resources :upvotes, only: :create
  end

resources :favorite_ideas, only: [:create, :destroy]

  root 'ideas#index'

  get 'auth/facebook', as: "login"
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout'  => 'sessions#destroy', as: "logout"

  get 'upvotesort' => 'ideas#upvotesort'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
