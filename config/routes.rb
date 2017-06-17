Rails.application.routes.draw do
  root 'ideas#index'

  devise_for :users

  resources :ideas do
    resources :upvotes, only: [:create]
  end

  get 'users/new'
  get 'sessions/new'
  get 'upvotes/vote'
  post 'ideas/index'

  get 'auth/facbeook', as: "login"
  get 'auth/facebook/callback', to: 'sessions#create'
  get'logout' => 'sessions#destroy', as:"logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
