Rails.application.routes.draw do
  # get 'session/new'
  #
  # get 'session/create'
  #
  # get 'session/destroy'
  #
  # get 'users/new'
  #
  # get 'users/create'

  resources :users, only: [:new, :create, :show]

  resource :session, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
