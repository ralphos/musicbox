Musicbox::Application.routes.draw do
  root :to => 'pages#landing'

  resources :songs
  
  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'

  match '/signout' => 'sessions#destroy', :as => :signout
  match '/signin' => 'sessions#new', :as => :signin

  post '/get-song' => 'pages#get-song'
  
  match '/songs/new'=>'songs#new', :as=> :new_song
  

end
