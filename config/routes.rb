Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'guests#index'

  resources :guests, only: [:index, :show]
  resources :episodes, only: [:index, :show]

  resources :appearances, only: [:new, :create]

  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy', as: 'logout'
end
