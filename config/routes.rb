Rails.application.routes.draw do

  devise_for :users
  resources :lists
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root to: "home#index"
end
