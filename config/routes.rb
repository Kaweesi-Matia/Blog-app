Rails.application.routes.draw do
  devise_for :users

  devise_scope :admin do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :admins
 
  
   # Restful design routes
 
   root "users#index"

   resources :users, only: [:index, :show] do 
     resources :posts,only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only:[:new, :create, :destroy,:index,:show] 
      resources :likes, only:[ :create]
     end 
   end
end
