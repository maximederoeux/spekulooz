Rails.application.routes.draw do

  devise_for :users
  resources :items
  resources :accounts
  resources :users

	match '/', to: 'users#index', constraints: { subdomain: '' }, via: [:get, :post, :put, :patch, :delete]
  match '/', to: 'visitors#index', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'visitors#index'
end
