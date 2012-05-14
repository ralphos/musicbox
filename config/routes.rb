Musicbox::Application.routes.draw do
  
  match '/feed' => 'songs#feed', :as => :feed

  root :to => 'pages#landing'

  resources :songs
  resources :users do
      member do
        get :following, :followers
      end
    end
    
  resources :playlists
  
  resources :relationships, only: [:create, :destroy]
  
  match "/pages/about" => "pages#about", :as => :about_us
  
  get "relationships/create"

  get "relationships/destroy"
  
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'

  match '/signout' => 'sessions#destroy', :as => :signout
  
  match '/signin/fb' => 'sessions#new_facebook', :as => :signin_facebook
  match '/signin/tw' => 'sessions#new_twitter', :as => :signin_twitter
  
  post '/get-song' => 'pages#get-song'
  
  match 'songs/show'=>'songs#show' #=> will reroute this once relation with playlists defined
  
  post '/song_search' => 'songs#search'
  
  post '/add-song' => 'songs#new'
  
  get '/play' => 'songs#play', :as => :play_all

end
