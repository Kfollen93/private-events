Rails.application.routes.draw do
  resources :users, :sessions, :events
  
  root 'users#welcome'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  post '/events' => 'events#create'
end
