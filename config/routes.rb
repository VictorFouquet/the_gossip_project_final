Rails.application.routes.draw do
	
	resources :gossip 

	resources :comment

	resources :user

	resources :city
	
	resources :sessions, only: [:new, :create, :destroy]

	resources :like, only: [:new, :create, :destroy]

	get 'welcome/:name', to: 'welcome#show'
  
  get 'contact', to: 'contact#show'
  
  root 'gossip#index'
  
  get 'team', to: 'team#show'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
