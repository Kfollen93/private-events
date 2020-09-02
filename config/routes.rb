Rails.application.routes.draw do
  resources :users
  root 'users#new'
  get "users/show"
end
