Rails.application.routes.draw do

  resources :elevators
  resources :columns
  resources :batteries
  resources :building_details
  resources :buildings
  resources :customers
  resources :addresses
  resources :leads
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :quotes
  resources :employees

  devise_for :users
  get 'quotes/new'
  get 'home/quote'
  get 'home/residential'
  get 'home/commercial'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
