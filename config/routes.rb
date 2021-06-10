Rails.application.routes.draw do

<<<<<<< HEAD
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
=======
  resources :quotes
>>>>>>> main
  resources :employees

  devise_for :users
  get 'home/quote'
  get 'home/residential'
  get 'home/commercial'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
