Rails.application.routes.draw do
  resources :users, :sessions
  
  root 'users#welcome'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
