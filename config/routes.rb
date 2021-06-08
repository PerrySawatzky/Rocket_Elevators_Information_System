Rails.application.routes.draw do
  get 'pages/commercial'
  get 'pages/residential'
  get 'pages/quote'
  get 'quote_page/quote'
  #get 'home/quote'
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
