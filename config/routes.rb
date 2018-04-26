Rails.application.routes.draw do

  resources :payments, only: [:index, :new, :destroy]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#index'
end
