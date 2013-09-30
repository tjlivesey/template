Template::Application.routes.draw do
  root to: "users#show"

  # User routes
  get '/signup' => 'users#new'
  resources :users, except: :index
  
  # Session routes
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout
end
