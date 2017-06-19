Rails.application.routes.draw do
  resources :ideas
  root 'ideas#index'



  get 'auth/facebook', as: "login"
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout'   => 'sessions#destroy', as: "logout"

  get 'userprofile' => 'user#show'

  post 'userprofile' => 'user#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
