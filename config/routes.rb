Rails.application.routes.draw do

  resources :items
  resources :accounts

	match '/', to: 'items#index', constraints: { subdomain: '' }, via: [:get, :post, :put, :patch, :delete]
  match '/', to: 'accounts#show', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'visitors#index'
end
