Musicbox::Application.routes.draw do

  get "relationships/create"

  get "relationships/destroy"

  root :to => 'pages#landing'

  resources :songs
  resources :users do
      member do
        get :following, :followers
      end
    end
    
  resources :playlists
  
  resources :relationships, only: [:create, :destroy]
  
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'

  match '/signout' => 'sessions#destroy', :as => :signout
  
  match '/signin/fb' => 'sessions#new_facebook', :as => :signin_facebook
  match '/signin/tw' => 'sessions#new_twitter', :as => :signin_twitter
  
  post '/get-song' => 'pages#get-song'
  
  match 'songs/show'=>'songs#show' #=> will reroute this once relation with playlists defined
  
  post '/song_search' => 'songs#search'

end
