Rails.application.routes.draw do
  resources :users


  get 'gif/cool'

  get 'gif/free'

  post 'users/show'

  get '/index' => 'users#index'

# check these later to be sure they aren't needed.
  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'

# default root goes to gif#cool. however requires login befor using, so may redirect back to login.
  root to: 'gif#cool'

  # NamedRoutes for showing login form and then login. logout as well
  get '/login' => 'users#new'
  post '/login' =>'sessions#create'
  get '/logout' => 'sessions#destroy'


# named route for cool or sweet
  get '/cool' => 'gif#cool'
  get '/sweet' => 'gif#sweet'

# signup routes
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/error' => 'users#error'
  get '/new' => 'users#logged_in_and_new'


  get '*path' => 'users#route_error'


  
end
