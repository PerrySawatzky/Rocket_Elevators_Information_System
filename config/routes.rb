Rails.application.routes.draw do

  resources :quotes
  resources :employees

  devise_for :users
  get 'home/quote'
  get 'home/residential'
  get 'home/commercial'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
