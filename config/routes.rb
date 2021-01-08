Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'omniauth'
  }

	root 'articles#index'
	# get '/articles', to: 'articles#index'
	# get '/articles/:id', to: 'articles#show'

	#Rails provides a routes method named resources that maps all of the conventional routes for a collection of resources,
	resources :articles do
		resources :comments
	end
	
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  
end
