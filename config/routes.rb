Rails.application.routes.draw do
  resources :requests
  resources :users
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :update, :create, :destroy]
      resources :requests, only: [:index, :update, :create, :destroy]
    end
  end
end
