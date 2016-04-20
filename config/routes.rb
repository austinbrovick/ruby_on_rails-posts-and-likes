Rails.application.routes.draw do


  get '/users/logout' => 'users#logout'
  get '/users/:id' => 'users#show'
  get '/likes/:id' => 'likes#like'
  get '/likes/:id/show' => 'posts#show'

  post '/users/register' => 'users#register'

  get '/' => 'users#index'
  get '/posts' => 'posts#index'
  post '/posts/create' => 'posts#create'
  post '/users/login' => 'users#login'
  delete '/posts/:id' => 'posts#destroy'


end
