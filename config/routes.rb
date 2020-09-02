Rails.application.routes.draw do
  resources :users
  root 'users#new'
  get 'users/show' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
