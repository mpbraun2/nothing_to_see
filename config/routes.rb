Rails.application.routes.draw do
  root 'users#index'
  post 'users' => 'users#create'
  post 'users/authenticate' => 'users#authenticate'
  get '/shoes' => 'products#index'
  get 'users/show' => 'users#show'
  get 'logout' => 'users#logout'
  get '/dashboard' => 'products#dashboard'
  get '/new' => 'products#new'
  post '/create' => 'products#create'
end
