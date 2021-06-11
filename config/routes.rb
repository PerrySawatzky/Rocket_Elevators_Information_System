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

  
# 	post "/home/testpost", to: "home#testpost"
# 	get "/index", to: "rocket#index"
# 	get "/quote", to: "rocket#quote"
# 	get "/residential", to: "rocket#residential"
# 	get "/commercial", to: "rocket#commercial"

# 	mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
# 	resources :employees
# 	get 'home/index'
# 	get 'home_controller/index'
# 	devise_for :users     

# 	post "/quotes/create", to: "quotes#create"
# end