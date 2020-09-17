Rails.application.routes.draw do
  get '/users/stay_logged_in', to: 'users#stay_logged_in'
  post '/users/login', to: 'users#login'
  get '/profile', to: 'users#show'
  resources :chat_rooms, only: [:index, :show]
  resources :messages, only: [:index, :create]
  resources :users, only: [:index, :create, :show, :update]
  mount ActionCable.server => '/cable'
end