Rails.application.routes.draw do

	root 'static_pages#home'
	get    '/about',   to: 'static_pages#about'

	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

	get "profile" => "users#show", :as => 'profile'

	resources :men do
		resources :comments
	end 

end


