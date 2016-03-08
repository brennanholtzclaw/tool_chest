Rails.application.routes.draw do

  # namespace :admin do
  #     resources :categories
  #     resources :tools
  #   end

  resources :tools
  resources :users, only: [:new, :create, :show]
  resources :categories
  #   resources :users, only: [:new, :create, :show]
  #   resources :tools, only: [:new, :create, :show, :index]
  #   resources :categories, only: [:index, :show]

  root to: 'users#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end

#
