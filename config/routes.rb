Rails.application.routes.draw do
  get 'quote_page/quote'
  #sget 'home/quote'
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
