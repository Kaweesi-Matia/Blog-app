Rails.application.routes.draw do
 
  
   # Restful design routes
 
  root 'users#index'
  get '/users/:id', to: 'users#show'
  get 'users/:id/posts', to:'posts#index'
  get 'users/:id/posts/:id', to:'posts#show'
end
