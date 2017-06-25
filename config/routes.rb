Rails.application.routes.draw do

  resources :ideas do
    resources :conversations, only: [:show, :new, :create]
    resources :upvotes, only: [:create]
    resources :comments, only: [:create]


    # Sorting Comments Routes
    get '/sortedcomments' => 'comments#sorting_comments'
  end
  resources :conversations, only: [:update]
  resources :favorite_ideas, only: [:create, :destroy]

  root 'ideas#index'

  get 'conversations' => 'conversations#index'


  get 'auth/facebook', as: "login"
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout'   => 'sessions#destroy', as: "logout"

  get 'usersprofile/:id(:.format)' => 'users#show', as: 'usersprofile'
  put 'editusersprofile/:id' => 'users#update', as: 'editusersprofile'


  get 'upvotesort' => 'ideas#upvotesort'
  get 'oldestfirst' => 'ideas#sort_by_oldest_first'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'tokens' => 'tokens#create'
  # post '/ideas/conversations' => 'conversations#create'

  # Serve Websockets cable requests in-process
  mount ActionCable.server => '/cable'

end
