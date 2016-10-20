Rails.application.routes.draw do
  resources :reservations
  resources :menu_categories
  resources :item_categories
  resources :categories
  resources :menus
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'visitors#index'
	devise_for :users, controllers: { registrations: "registrations" }
  resources :items
  resources :users
  resources :accounts
  get 'about' => 'visitors#about'



end
