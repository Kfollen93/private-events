Rails.application.routes.draw do
  resources :users
  root 'users#new'
  get '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
