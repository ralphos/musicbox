Musicbox::Application.routes.draw do
  
  get "songs/index"

  root :to => 'pages#landing'

  match '/auth/:provider/callback' => 'sessions#create'
  match '/auth/failure' => 'sessions#failure'

  match '/signout' => 'sessions#destroy', :as => :signout
  match '/signin' => 'sessions#new', :as => :signin
  
  match '/songs' =>'songs#index'
end
