Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  post '/users/login', to: 'users#login'
  get '/users/stay_logged_in', to: 'users#stay_logged_in'
  get '/users/wrongGuess/:user_id', to: 'users#wrongGuess'
  resources :chat_rooms, only: [:index, :create, :show]
  resources :messages, only: [:create]
  mount ActionCable.server => '/cable'
end