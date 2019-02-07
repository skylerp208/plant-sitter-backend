Rails.application.routes.draw do
  resources :requests
  resources :users
  namespace :api do
    namespace :v1 do
      resources :users
      resources :requests 
      get '/profile', to: "users#profile"
      post '/login', to: 'auth#create'
      get '/current_user', to: 'auth#show'
    end
  end
end
