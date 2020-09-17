Rails.application.routes.draw do
  resources :chat_rooms, only: [:index, :show]
  resources :messages, only: [:index, :create]
  resources :users, only: [:index, :create, :show, :update]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#show'
  mount ActionCable.server => '/cable'
end