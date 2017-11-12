Rails.application.routes.draw do

	# get 'products/index'

 #  　get 'products/show'





  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :posts, :users, :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root"products#index"
end
