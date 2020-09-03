Rails.application.routes.draw do
  resources :users, :sessions
  root 'users#welcome'
  get '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
