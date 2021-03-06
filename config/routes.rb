Rails.application.routes.draw do
  resources :destination_foods
  resources :destination_activities
  resources :likes, only: [:show, :create, :index]
  resources :foods, only: [:show, :index]
  resources :activities, only: [:show, :index, :edit, :update]
  resources :destinations, only: [:show, :index]
  resources :login, only: [:new, :create]
  resources :destination_activities

  get '/countries/:name', to: 'countries#show', as: 'countries'
  get '/users/stats', to: 'users#stats', as: 'stats'
  get '/packages/:name', to: 'packages#show', as: 'packages'
  post '/packages/:name', to: 'packages#edit', as: 'edit_packages'
  patch '/packages/:name', to: 'packages#update', as: 'patch_packages'
  
  # root 'hurray#index'
  root to: 'welcome#home', as: 'home'
  resources :users do
    resources :trips, controller: 'users/trips', shallow: true
  end

  post 'activities/:trip', to: 'activities#addactivities', as: 'add_activities'
  post 'destinations/:trip', to: 'destinations#adddestination', as: 'add_destination'

  patch '/activities/:id/dislikes', to: 'activities#dislikes', as: 'dislikes'
  patch '/activities/:id/add_likes', to: 'activities#add_likes', as:'add_likes'

  delete "logout", to: "login#destroy", as: "logout"
  delete "delete", to: "users#destroy", as: "delete"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


