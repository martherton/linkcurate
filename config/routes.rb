Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "linkcats#index"
  resources :linkcats do
    resources :wlinks
   end
  
  resource :session
  
  resource :users do
  	resources :linkcats
    resources :wlinks
  	
  end	

  resources :wlinks do
    resources :comments
    resources :votes
   end 

end
