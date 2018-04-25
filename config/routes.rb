Rails.application.routes.draw do
  resources :payments
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'hello', to: 'hello#hello'
  get 'persons/main', as: 'user_root'





  root 'application#index'
end
