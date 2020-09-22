Rails.application.routes.draw do
  resources :users, :sessions, :events, :attendings

  resources :events do
    post 'attend', on: :member
  end

  root 'users#welcome'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
