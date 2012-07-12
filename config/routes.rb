Musicbox::Application.routes.draw do

  root :to => 'pages#landing'

  resources :songs
  resources :playlists
  
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'

  match '/signout' => 'sessions#destroy', :as => :signout
  
  match '/signin/fb' => 'sessions#new_facebook', :as => :signin_facebook
  match '/signin/tw' => 'sessions#new_twitter', :as => :signin_twitter
  
  post '/get-song' => 'pages#get-song'
  
  match '/songs/new'=>'songs#new', :as=> :new_song
  

end
